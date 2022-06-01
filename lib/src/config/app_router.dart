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
      case ProfilePage.routeName:
        return ProfilePage.route();
      case CartPage.routeName:
        return CartPage.route();
      case ChatPage.routeName:
        return ChatPage.route();
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
