import 'package:flutter/material.dart';

import '../models/book_details.dart';
import './book_details_details_table.dart';

class BookDetailsDescCard extends StatelessWidget {
  const BookDetailsDescCard({
    Key? key,
    required this.bookDetails,
  }) : super(key: key);

  final BookDetails? bookDetails;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(bookDetails!.desc!),
            const SizedBox(height: 5),
            DetailsText(title: 'Publisher', content: bookDetails!.publisher!),
            DetailsText(title: 'Language', content: bookDetails!.language!),
            DetailsText(title: 'ISBN-10', content: bookDetails!.isbn10!),
            DetailsText(title: 'ISBN-13', content: bookDetails!.isbn13!),
            DetailsText(title: 'Pages', content: bookDetails!.pages!),
            DetailsText(title: 'Year', content: bookDetails!.year!),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
