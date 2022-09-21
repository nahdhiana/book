import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/books_provider.dart';
import '../screens/book_details_screen.dart';
import '../screens/book_list_screen.dart';

void main() {
  runApp(const ProjectRoot());
}

class ProjectRoot extends StatelessWidget {
  const ProjectRoot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BooksProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(useMaterial3: true),
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal),
        ),
        themeMode: ThemeMode.system,
        initialRoute: BookListScreen.routeName,
        routes: {
          BookListScreen.routeName: (_) => const BookListScreen(),
          BookDetailsScreen.routeName: (_) => const BookDetailsScreen(),
        },
      ),
    );
  }
}
