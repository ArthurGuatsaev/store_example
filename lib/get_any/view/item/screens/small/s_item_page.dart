import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:store_example/const/extension.dart';
import 'package:store_example/get_any/domain/blocs/file/file_bloc.dart';
import 'package:store_example/get_any/view/main/widgets/my_listtile.dart';
import 'package:store_example/get_any/view/widgets/my_appbar.dart';

class SItemPage extends StatefulWidget {
  final String item;
  final int image;
  const SItemPage({
    super.key,
    required this.item,
    required this.image,
  });

  @override
  State<SItemPage> createState() => _SItemPageState();
}

class _SItemPageState extends State<SItemPage> {
  String? value;

  @override
  Widget build(BuildContext context) {
    value =
        context.select<FileBloc, FileState>((value) => value.state).fileData;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<FileBloc>().add(ReadFileMethodEvent()),
      ),
      body: CustomScrollView(
        slivers: [
          const MyAppBar(title: ''),
          SliverToBoxAdapter(
            child: Hero(
              tag: 'item ${widget.item}',
              child: FittedBox(
                child: Container(
                  color: context.color.primary,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageHolder(image: 'assets/images/${widget.image}.png'),
                      Text(value!),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 50),
            child: Text('hello item ${widget.item}',
                style: context.text.important),
          )),
        ],
      ),
    );
  }
}
