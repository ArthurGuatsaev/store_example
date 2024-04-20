import 'dart:async';

abstract class BaseAnyRepository {
  List<String>? anyList;
  FutureOr<List<String>> getAnyList(int page, int limit);
}
