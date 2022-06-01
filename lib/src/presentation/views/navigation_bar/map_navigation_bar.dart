import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/icon_button_nav_bar.dart';
import 'components/main_button_nav_bar.dart';

class MapNavBar extends StatefulWidget {
  static const String routeName = 'MapNavBar';

  const MapNavBar({Key? key}) : super(key: key);

  static Route route() {
    return PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        pageBuilder: (_, __, ___) => const MapNavBar());
  }

  @override
  _MapNavBarState createState() => _MapNavBarState();
}

class _MapNavBarState extends State<MapNavBar> {
  int pageIndex = 0;

  final pages = [
    const Center(),
    const Center(),
    const Center(),
    const Center(),
  ];

  selectedIndex(int index) {
    if (index == 0) {
      Navigator.pushNamedAndRemoveUntil(
          context, 'MainNavBar', (route) => false);
    } else if (index == 1) {
    } else if (index == 2) {
    } else if (index == 3) {
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
            child: MainButtonNabBar(
                title: 'Maps',
                pageIndex: pageIndex,
                evaIcons: EvaIcons.gridOutline),
          ),
          IconButtonNabBar(
            pageIndex: pageIndex,
            evaIcons: EvaIcons.optionsOutline,
            selectedIndex: selectedIndex,
            currentIndex: 1,
            showDot: false,
          ),
          IconButtonNabBar(
            pageIndex: pageIndex,
            evaIcons: EvaIcons.navigation2Outline,
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
