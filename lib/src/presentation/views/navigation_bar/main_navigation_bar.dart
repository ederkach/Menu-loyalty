import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/icon_button_nav_bar.dart';
import 'components/main_button_nav_bar.dart';
import '../home_page/home_page.dart';

class MainNavBar extends StatefulWidget {
  static const String routeName = 'MainNavBar';

  const MainNavBar({Key? key}) : super(key: key);

  static Route route() {
    return PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        pageBuilder: (_, __, ___) => const MainNavBar());
  }

  @override
  _MainNavBarState createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar> {
  int pageIndex = 0;

  final pages = [
    const HomePage(),
    const Center(),
    const Center(),
    const Center(),
  ];

  selectedIndex(int index) {
    if (index != 3) {
      setState(() {
        pageIndex = index;
      });
    } else {
      Navigator.pushNamed(context, 'ProfilePage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: Stack(children: [pages[pageIndex]]),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 104.h,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              selectedIndex(0);
            },
            child:
                MainButtonNabBar(pageIndex: pageIndex, evaIcons: EvaIcons.home),
          ),
          IconButtonNabBar(
            pageIndex: pageIndex,
            evaIcons: EvaIcons.shoppingBagOutline,
            selectedIndex: selectedIndex,
            currentIndex: 1,
            showDot: false,
          ),
          IconButtonNabBar(
            pageIndex: pageIndex,
            evaIcons: EvaIcons.messageCircleOutline,
            selectedIndex: selectedIndex,
            currentIndex: 2,
            showDot: true,
          ),
          IconButtonNabBar(
            pageIndex: pageIndex,
            evaIcons: EvaIcons.personOutline,
            selectedIndex: selectedIndex,
            currentIndex: 3,
            showDot: false,
          ),
        ],
      ),
    );
  }
}
