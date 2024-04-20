part of '../router.dart';

class MyRouterDelegate extends RouterDelegate<MyNavigationState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyNavigationState> {
  static MyRouterDelegate instance = MyRouterDelegate._();
  Map<String, Object> param = {};
  MyNavigationState? myNS;
  @override
  final GlobalKey<NavigatorState> navigatorKey =
      MyNavigatorManager.instance.key;
  MyRouterDelegate._();
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        const MaterialPage(child: MainPage()),
        if (myNS?.item == true)
          MaterialPage(
              child: ItemPage(item: param['item'] as String), name: 'item')
      ],
      onPopPage: onPop,
    );
  }

  @override
  MyNavigationState? get currentConfiguration => myNS;
  @override
  Future<void> setNewRoutePath(MyNavigationState configuration) async {
    myNS = configuration;
    notifyListeners();
  }

  @override
  Future<void> setInitialRoutePath(MyNavigationState configuration) async {}

  bool onPop(Route<dynamic> route, dynamic result) {
    switch (route.settings.name) {
      case 'item':
        myNS = MyNavigationState.home();
        notifyListeners();
    }
    return false;
  }

  void notify() => notifyListeners();
}
