import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:menu_loyalty/app/view/app_router/mobile/app_router.dart';
import 'package:menu_loyalty/app/view/views/home_page/home_page.dart';
import 'package:menu_loyalty/l10n/l10n.dart';

import 'components/icon_button_nav_bar.dart';
import 'components/main_button_nav_bar.dart';

class MainNavBar extends StatefulWidget {
  static const String routeName = 'MainNavBar';

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
    switch (index) {
      case 0:
        MapNavBarRoute().push(context);
        break;
      case 1:
        CartPageRoute().push(context);
        break;
      case 2:
        ChatsPageRoute().push(context);
        break;
      case 3:
        ProfilePageRoute().push(context);
        break;
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
    var designColorScheme = Theme.of(context).colorScheme;
    var sizer = MediaQuery.of(context);
    return Container(
      height: sizer.hwt(104),
      decoration: BoxDecoration(
        color: designColorScheme.onPrimary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
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
                title: context.l10n.homeMainButtonTitle,
                pageIndex: pageIndex,
                evaIcons: EvaIcons.home),
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
