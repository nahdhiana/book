import 'package:flutter/material.dart';

class DetailsText extends StatelessWidget {
  final String title;
  final String content;
  const DetailsText({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(6),
      },
      children: [
        TableRow(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              content,
              style: const TextStyle(fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ],
    );
  }
}
