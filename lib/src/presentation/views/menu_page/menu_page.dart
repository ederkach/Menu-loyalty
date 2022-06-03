import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: Padding(
        padding: EdgeInsets.only(top: 50.h),
        child: Container(
            height: 800.h,
            width: 375.w,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.r),
                topRight: Radius.circular(40.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  HeaderMenu(scrollVisibility: scrollVisibility),
                  CategoryListDish(scrollcontroller: scrollcontroller),
                ],
              ),
            )),
      ),
      floatingActionButton: Container(
        height: 72.w,
        width: 72.w,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            EvaIcons.homeOutline,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.all(
            Radius.circular(26.r),
          ),
        ),
      ),
    );
  }
}
