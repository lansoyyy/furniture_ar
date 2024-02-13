import 'package:flutter/material.dart';
import 'package:furniture_app/models/Categories.dart';

class Categories extends StatelessWidget {
  const Categories({
    required this.categories,
  }) : super();

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
    );
  }
}
