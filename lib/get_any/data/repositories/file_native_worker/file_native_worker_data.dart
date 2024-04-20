import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:store_example/get_any/domain/repositories/file_native_worker/file_native_worker.dart';

class FileNativeWorkerRepository extends BaseFileReaderWorkerRepository {
  @override
  Future<String?> getFile() async {
    final path = await getApplicationDocumentsDirectory();
    final exist = await File("${path.path}/test.txt").exists();
    log('file exist $exist path ${path.path}');
    const channel = MethodChannel('file_reader');
    try {
      final result = await channel.invokeMethod<String>('tryReadFile');
      return result is String ? result : null;
    } on PlatformException catch (e) {
      log('file get error $e ');
      return null;
    }
  }

  @override
  Future<void> writeFile() async {
    final path = await getApplicationDocumentsDirectory();
    File('${path.path}/test.txt')
      ..open
      ..writeAsString('hello, my name is Arthur Guatsaev');
  }
}
