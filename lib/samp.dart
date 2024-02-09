import 'package:ar_core/ar_core.dart';
import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  String image;

  HelloWorld({required this.image});

  @override
  Widget build(BuildContext context) {
    return Augmented(image);
  }
}
