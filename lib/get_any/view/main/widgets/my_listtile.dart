import 'package:flutter/material.dart';
import 'package:store_example/const/extension.dart';

class MyListTile extends StatelessWidget {
  const MyListTile(
      {super.key, required this.item, required this.func, this.image});

  final String item;
  final Function() func;
  final String? image;

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
        leading: image != null ? ImageHolder(image: image) : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        title: Text(item),
      ),
    );
  }
}

class ImageHolder extends StatelessWidget {
  const ImageHolder({
    super.key,
    required this.image,
  });

  final String? image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image!,
      errorBuilder: (context, error, stackTrace) =>
          const CircularProgressIndicator.adaptive(),
      fit: BoxFit.fill,
    );
  }
}
