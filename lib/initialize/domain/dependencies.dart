part of '../initialize.dart';

abstract interface class Dependencies {
  abstract final BaseAnyRepository aR;
  abstract final BaseFileReaderWorkerRepository fR;
  final Map<String, Object> context = {};
}

class MutableDependencies implements Dependencies {
  @override
  final Map<String, Object> context = {};
  @override
  late BaseAnyRepository aR;
  @override
  late BaseFileReaderWorkerRepository fR;

  Dependencies freeze() => UnmutableDependencies(
        aR: aR,
        fR: fR,
        context: context,
      );
}

final class UnmutableDependencies implements Dependencies {
  @override
  final BaseAnyRepository aR;
  @override
  final BaseFileReaderWorkerRepository fR;
  @override
  final Map<String, Object> context;
  const UnmutableDependencies({
    required this.aR,
    required this.fR,
    required this.context,
  });
}

class InheritedDependencies extends InheritedWidget {
  final Dependencies dependencies;
  const InheritedDependencies({
    required super.child,
    super.key,
    required this.dependencies,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static Dependencies of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<InheritedDependencies>()!
      .dependencies;
}
