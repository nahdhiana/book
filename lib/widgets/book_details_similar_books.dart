import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/similar_books.dart';

class BookDetailsSimilarBooks extends StatelessWidget {
  const BookDetailsSimilarBooks({
    Key? key,
    required this.similarBooks,
    required this.width,
  }) : super(key: key);

  final SimilarBooks? similarBooks;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.all(5),
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final similarBookLists = similarBooks!.books![index];
          return SizedBox(
            width: width / 3,
            child: InkWell(
              splashColor: Colors.teal,
              onTap: () {
                final uri = Uri.parse(similarBookLists.url!);
                try {
                  launchUrl(uri);
                } on Exception catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.toString()),
                      duration: const Duration(milliseconds: 500),
                    ),
                  );
                }
              },
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: Image.network(similarBookLists.image!)),
                      Expanded(
                        child: Text(
                          similarBookLists.title!,
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: similarBooks!.books!.length,
      ),
    );
  }
}
