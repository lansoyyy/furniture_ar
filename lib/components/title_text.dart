import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    required this.title,
  }) : super();

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16, //16
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
