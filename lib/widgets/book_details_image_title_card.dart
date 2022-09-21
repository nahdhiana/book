import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/book_details.dart';

class BookDetailsImageTitleCard extends StatelessWidget {
  const BookDetailsImageTitleCard({
    Key? key,
    required this.bookDetails,
    required this.textTheme,
  }) : super(key: key);

  final BookDetails? bookDetails;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.network(
              bookDetails!.image!,
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookDetails!.title!,
                  style: textTheme.titleLarge,
                ),
                Text(
                  bookDetails!.authors!,
                  style: textTheme.subtitle1,
                ),
                // const SizedBox(height: 8),
                Text(
                  bookDetails!.subtitle!,
                  style: const TextStyle(fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 5),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      color: index < int.parse(bookDetails!.rating!)
                          ? Colors.amber
                          : Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Chip(
                  label: Text(
                    bookDetails!.price!,
                    style: const TextStyle(color: Colors.white),
                  ),
                  elevation: 3,
                  backgroundColor: Colors.teal,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    onTap: () {
                      final uri = Uri.parse(bookDetails!.url!);
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
                    splashColor: Colors.teal,
                    child: Card(
                      elevation: 8,
                      color: Colors.deepOrange,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.shopping_cart_checkout,
                              color: Colors.white,
                            ),
                            Text(
                              'Buy This Book',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
