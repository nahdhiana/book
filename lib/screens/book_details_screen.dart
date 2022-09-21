import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/books_provider.dart';
import '../widgets/book_details_desc_card.dart';
import '../widgets/book_details_image_title_card.dart';
import '../widgets/book_details_similar_books.dart';

class BookDetailsScreen extends StatefulWidget {
  static const routeName = '/book-details';

  const BookDetailsScreen({super.key});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  String isbn = '';
  BooksProvider? booksProvider;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      isbn = ModalRoute.of(context)?.settings.arguments as String;
      booksProvider = Provider.of<BooksProvider>(context, listen: false);
      booksProvider!.getBookDetails(ctx: context, isbn: isbn);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books Detail'),
        centerTitle: true,
      ),
      body: Consumer<BooksProvider>(
        //idk why need to use booksProvider? and error when using booksProvider!
        builder: (_, __, ___) => booksProvider?.bookDetails == null
            ? const Center(child: CircularProgressIndicator.adaptive())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    BookDetailsImageTitleCard(
                      bookDetails: booksProvider!.bookDetails,
                      textTheme: textTheme,
                    ),
                    const Divider(),
                    const Text(
                      'Description',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    BookDetailsDescCard(
                        bookDetails: booksProvider!.bookDetails),
                    const Divider(),
                    const Text(
                      'Similar Books',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    booksProvider!.similarBooks == null
                        ? const Center(
                            child: CircularProgressIndicator.adaptive())
                        : BookDetailsSimilarBooks(
                            similarBooks: booksProvider!.similarBooks,
                            width: width,
                          ),
                  ],
                ),
              ),
      ),
    );
  }
}
