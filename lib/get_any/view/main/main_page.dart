import 'package:flutter/material.dart';
import 'package:store_example/get_any/view/main/screens/small/s_main_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return switch (constraints.maxWidth) {
          < 500 => const SMainPag(),
          _ => const SMainPag(),
        };
      },
    );
  }
}
