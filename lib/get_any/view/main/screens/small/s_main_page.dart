import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/navigation/router.dart';
import '../../../../domain/blocs/any/any_bloc_bloc.dart';
import '../../../widgets/my_appbar.dart';
import '../../widgets/my_listtile.dart';

class SMainPag extends StatelessWidget {
  const SMainPag({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AnyBloc, AnyState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              const MyAppBar(title: 'items'),
              AnyListView(state: state),
            ],
          );
        },
      ),
    );
  }
}

class AnyListView extends StatefulWidget {
  final AnyState state;
  const AnyListView({
    super.key,
    required this.state,
  });

  @override
  State<AnyListView> createState() => _AnyListViewState();
}

class _AnyListViewState extends State<AnyListView> {
  @override
  Widget build(BuildContext context) {
    final any = context.read<AnyBloc>();
    return SliverList.builder(
      itemCount: widget.state.anyList.length,
      itemBuilder: (context, index) {
        final item = widget.state.anyList[index];
        any.add(LoadNextAnyDataEvent(index: index));
        return Hero(
          tag: 'item $item',
          child: Material(
            child: MyListTile(
              item: 'какое-то название --> $item',
              func: () => MyNavigatorManager.instance.pushItem(item),
            ),
          ),
        );
      },
    );
  }
}
