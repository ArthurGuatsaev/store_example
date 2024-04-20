import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_example/get_any/view/item/screens/small/s_item_page.dart';

import '../../../initialize/initialize.dart';
import '../../domain/blocs/file/file_bloc.dart';

class ItemPage extends StatelessWidget {
  final String item;
  final int image;
  const ItemPage({
    super.key,
    required this.item,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final fR = context
        .dependOnInheritedWidgetOfExactType<InheritedDependencies>()
        ?.dependencies
        .fR;
    return BlocProvider<FileBloc>(
      create: (context) => FileBloc(fR: fR!),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return switch (constraints.minWidth) {
            < 500 => SItemPage(item: item, image: image),
            _ => SItemPage(item: item, image: image),
          };
        },
      ),
    );
  }
}
