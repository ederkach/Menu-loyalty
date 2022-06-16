import 'package:flutter/material.dart';
import 'package:menu_loyalty/src/data/models/menu_model/menu_model.dart';

import '../presentation/views/pages.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Go to => ${settings.name}');
    final menuModel =
        settings.arguments as MenuModel? ?? const MenuModel(name: 'No data');

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
      case DishPage.routeName:
        return MaterialPageRoute(
            builder: (context) => DishPage(
                  menuModel: menuModel,
                ));
      case OrdersHistoryPage.routeName:
        return OrdersHistoryPage.route();
      case ProfilePage.routeName:
        return ProfilePage.route();
      case CheckOutPage.routeName:
        return CheckOutPage.route();
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
