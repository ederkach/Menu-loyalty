import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:menu_loyalty/src/config/size_config.dart';

import 'components/category_list_dish.dart';
import 'components/header_menu.dart';

class MenuPage extends StatefulWidget {
  static const String routeName = 'MenuPage';

  const MenuPage({Key? key}) : super(key: key);

  static Route route() {
    return PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        pageBuilder: (_, __, ___) => const MenuPage());
  }

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final ScrollController scrollcontroller = ScrollController();

  bool scrollVisibility = true;

  @override
  initState() {
    scrollcontroller.addListener(() {
      if (scrollcontroller.position.pixels > 80) {
        setState(() {
          scrollVisibility = false;
        });
      } else {
        setState(() {
          scrollVisibility = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollcontroller;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var sizer = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: designColorScheme.secondaryContainer,
      body: Padding(
        padding: EdgeInsets.only(
          top: sizer.hwt(50),
        ),
        child: Container(
            height: sizer.hwt(800),
            width: sizer.w(375),
            decoration: BoxDecoration(
              color: designColorScheme.onPrimary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: sizer.w(24),
              ),
              child: Column(
                children: [
                  HeaderMenu(scrollVisibility: scrollVisibility),
                  CategoryListDish(scrollcontroller: scrollcontroller),
                ],
              ),
            )),
      ),
      floatingActionButton: Container(
        height: sizer.w(72),
        width: sizer.w(72),
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            EvaIcons.homeOutline,
            color: designColorScheme.onPrimary,
          ),
        ),
        decoration: BoxDecoration(
          color: designColorScheme.primary,
          borderRadius: const BorderRadius.all(
            Radius.circular(26),
          ),
        ),
      ),
    );
  }
}
