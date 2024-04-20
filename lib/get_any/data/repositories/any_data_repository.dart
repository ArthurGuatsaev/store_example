import 'dart:async';

import 'package:store_example/get_any/data/api_client/any_client.dart';
import 'package:store_example/get_any/domain/repositories/any_repository.dart';

class AnyRepository extends BaseAnyRepository {
  @override
  FutureOr<List<String>> getAnyList(int page, int limit) {
    final x = AnyApiClient.getAnyList(page, limit);
    return (anyList ??= [])..addAll(x);
  }
}
