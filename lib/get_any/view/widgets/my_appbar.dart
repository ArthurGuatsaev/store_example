import 'package:flutter/material.dart';
import 'package:store_example/const/extension.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  const MyAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        title: Text(title, style: context.text.important), centerTitle: true);
  }
}
