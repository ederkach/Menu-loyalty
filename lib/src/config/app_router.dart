import 'package:flutter/material.dart';

import '../presentation/views/pages.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Go to => ${settings.name}');

    switch (settings.name) {
      case '/':
        return MainNavBar.route();
      case MainNavBar.routeName:
        return MainNavBar.route();
      case MapNavBar.routeName:
        return MapNavBar.route();
      case HomePage.routeName:
        return HomePage.route();
      case MenuPage.routeName:
        return MenuPage.route();
      case MenuDishPage.routeName:
        return MenuDishPage.route();
      case ProfilePage.routeName:
        return ProfilePage.route();
      case CartPage.routeName:
        return CartPage.route();
      case ChatsPage.routeName:
        return ChatsPage.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('Error'),
              ),
            ));
  }
}
