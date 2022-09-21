import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/book_details.dart';
import '../models/books.dart';
import '../models/similar_books.dart';
import '../widgets/error_dialog.dart';

class BooksProvider with ChangeNotifier {
  BooklistModel? booklist;

  getListBook(ctx) async {
    var url = Uri.https('api.itbook.store', '/1.0/new');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        booklist = BooklistModel.fromJson(responseBody);
      }
    } on Exception {
      showDialog(
        context: ctx,
        builder: (_) {
          return const ErrorDialog();
        },
      ).then((_) => getListBook(ctx));
    }
    notifyListeners();
  }

  BookDetails? bookDetails;
  SimilarBooks? similarBooks;

  getBookDetails({required ctx, required isbn}) async {
    var url = Uri.https('api.itbook.store', '/1.0/books/$isbn');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        bookDetails = BookDetails.fromJson(responseBody);
      }
      getSimilarBooks(bookDetails!.title!, ctx);
    } on Exception {
      showDialog(
        context: ctx,
        builder: (_) {
          return const ErrorDialog();
        },
      ).then((_) => getBookDetails(ctx: ctx, isbn: isbn));
    }
    notifyListeners();
  }

  getSimilarBooks(String title, ctx) async {
    var url = Uri.https('api.itbook.store', '/1.0/search/$title');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        similarBooks = SimilarBooks.fromJson(responseBody);
      }
    } on Exception {
      showDialog(
        context: ctx,
        builder: (_) {
          return const ErrorDialog();
        },
      ).then((_) => getSimilarBooks(title, ctx));
    }
    notifyListeners();
  }
}
