import 'package:flutter/material.dart';

class TextFieldTitle extends StatelessWidget {
  final String title;

  const TextFieldTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.start,

      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, height: 3),
    );
  }
}
