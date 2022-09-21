import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/books_provider.dart';
import '../screens/book_details_screen.dart';
import '../widgets/booklist_list_tile.dart';

class BookListScreen extends StatefulWidget {
  static const routeName = '/';
  const BookListScreen({super.key});

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  BooksProvider? bookListProvider;

  @override
  void initState() {
    bookListProvider = Provider.of<BooksProvider>(context, listen: false);
    bookListProvider!.getListBook(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Catalogue'),
        centerTitle: true,
      ),
      body: Consumer<BooksProvider>(
        builder: (_, __, ___) => bookListProvider!.booklist == null
            ? const Center(child: CircularProgressIndicator.adaptive())
            : SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    final currentBook =
                        bookListProvider!.booklist!.books![index];
                    return InkWell(
                      splashColor: Colors.teal,
                      child: ListTileOfBooklist(currentBook: currentBook),
                      onTap: () => Navigator.pushNamed(
                        context,
                        BookDetailsScreen.routeName,
                        arguments: currentBook.isbn13,
                      ),
                    );
                  },
                  itemCount: bookListProvider!.booklist!.books!.length,
                ),
              ),
      ),
    );
  }
}
