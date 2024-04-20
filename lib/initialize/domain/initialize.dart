part of '../initialize.dart';

Future<Dependencies> $initializeDependencies(
    {Function(int progress, String message)? onProgress}) async {
  final dependencies = MutableDependencies();
  final totalStaps = _initializationSteps.length;
  var currentStep = 0;
  for (final step in _initializationSteps.entries) {
    currentStep++;
    final percent = (currentStep * 100 ~/ totalStaps).clamp(0, 100);
    onProgress?.call(percent, step.key);
    await step.value(dependencies);
    log('initialization: $currentStep/$totalStaps ($percent) | ${step.key}');
  }
  return dependencies.freeze();
}

typedef _InitializationStep = FutureOr<void> Function(
    MutableDependencies dependencies);
final Map<String, _InitializationStep> _initializationSteps =
    <String, _InitializationStep>{
  'Base repository initialization': (dependencies) async {
    final aR = AnyRepository();
    await aR.getAnyList(0, 20);
    dependencies.aR = aR;
    // чтобы посмотреть индикатор загрузки можно раскоментировать след строку
    // await Future.delayed(const Duration(seconds: 5));
  },
  'File native repository initialization': (dependencies) async {
    final fR = FileNativeWorkerRepository();
    await fR.writeFile();
    dependencies.fR = fR;
  },
};
