import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  final String text;
  const QuestionText({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: const TextStyle(fontSize: 14),
    );
  }
}