import 'package:flutter/material.dart';

import '../models/books.dart';

class ListTileOfBooklist extends StatelessWidget {
  const ListTileOfBooklist({
    Key? key,
    required this.currentBook,
  }) : super(key: key);

  final Books currentBook;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ListTile(
          leading: Image.network(
            currentBook.image!,
            fit: BoxFit.contain,
          ),
          title: Text(currentBook.title!),
          subtitle: Text(currentBook.subtitle!),
          trailing: Chip(
            label: Text(
              currentBook.price!,
              style: const TextStyle(color: Colors.white),
            ),
            elevation: 3,
            backgroundColor: Colors.teal,
          ),
        ),
      ),
    );
  }
}
