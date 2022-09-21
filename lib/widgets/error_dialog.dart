import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Ooopss!'),
      content: const Text(
          'Something Went Wrong! Check Your Internet Connection and Then Please Try Again Later!',
          textAlign: TextAlign.center),
      icon: const Icon(
        Icons.error_outline_rounded,
        size: 80,
      ),
      iconColor: Colors.red,
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        )
      ],
    );
  }
}
