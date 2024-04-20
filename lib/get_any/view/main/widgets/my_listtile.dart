import 'package:flutter/material.dart';
import 'package:store_example/const/extension.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.item,
    required this.func,
  });

  final String item;
  final Function() func;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
      child: ListTile(
        onTap: func,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        titleAlignment: ListTileTitleAlignment.top,
        tileColor: context.color.primary,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        title: Text(item),
      ),
    );
  }
}
