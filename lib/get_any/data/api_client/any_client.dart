class AnyApiClient {
  static Iterable<String> getAnyList(int page, int limit) sync* {
    final initial = page * limit;
    for (var i = initial; i < initial + limit; i++) {
      yield '$i';
    }
  }
}
