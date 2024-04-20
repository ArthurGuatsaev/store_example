import 'package:flutter/material.dart';

class MyOwnTransitionIos extends ZoomPageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
      PageRoute<T>? route,
      BuildContext? context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget? child) {
    return super
        .buildTransitions(route, context, animation, secondaryAnimation, child);
  }
}
