import 'dart:async';
import 'dart:math';

import 'package:store_example/get_any/data/api_client/any_client.dart';
import 'package:store_example/get_any/domain/repositories/any_repository.dart';

class AnyRepository extends BaseAnyRepository {
  @override
  FutureOr<List<String>> getAnyList(int page, int limit) async {
    await Future.delayed(Duration(milliseconds: Random(150).nextInt(800)));
    final x = AnyApiClient.getAnyList(page, limit);
    return (anyList ??= [])..addAll(x);
  }
}
