part of '../router.dart';

class MyRouterInformationParser
    extends RouteInformationParser<MyNavigationState> {
  @override
  Future<MyNavigationState> parseRouteInformation(
      RouteInformation routeInformation) async {
    final url = routeInformation.uri;

    if (url.pathSegments.isEmpty) {
      return MyNavigationState.home();
    }

    switch (url.pathSegments[0]) {
      case 'item':
        return MyNavigationState.item();
      default:
        return MyNavigationState.home();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(MyNavigationState configuration) {
    if (configuration.item) {
      return RouteInformation(
        uri: Uri.parse('/item'),
      );
    }
    if (configuration.home) {
      return RouteInformation(
        uri: Uri.parse('/main'),
      );
    }

    return RouteInformation(uri: Uri.parse('/main'));
  }
}
