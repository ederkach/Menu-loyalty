import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/icon_button_nav_bar.dart';
import '../../widgets/main_button_nav_bar.dart';
import '../home_page/home_page.dart';

class MainNavBar extends StatefulWidget {
  const MainNavBar({Key? key}) : super(key: key);

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
    setState(() {
      pageIndex = index;
    });
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
              evaIcons: EvaIcons.creditCardOutline,
              selectedIndex: selectedIndex,
              currentIndex: 1),
          IconButtonNabBar(
              pageIndex: pageIndex,
              evaIcons: EvaIcons.messageCircleOutline,
              selectedIndex: selectedIndex,
              currentIndex: 2),
          IconButtonNabBar(
              pageIndex: pageIndex,
              evaIcons: EvaIcons.personOutline,
              selectedIndex: selectedIndex,
              currentIndex: 3),
        ],
      ),
    );
  }
}
