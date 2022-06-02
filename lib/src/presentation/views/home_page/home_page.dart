import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menu_loyalty/src/constants/enums.dart';

import '../../widgets/bottom_panel.dart';
import '../../widgets/button_up_dark.dart';
import '../../widgets/label_widget.dart';
import '../../widgets/search_input_widget.dart';
import 'components/category_offer.dart';
import 'components/greetings_widget.dart';
import 'components/list_offer.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'HomePage';

  const HomePage({
    Key? key,
  }) : super(key: key);

  static Route route() {
    return PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        pageBuilder: (_, __, ___) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bottomPanelListWidgets = [
      GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'MenuPage');
          },
          child: const ButtonUpDark()),
      const ListOffer()
    ];
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: CircleAvatar(
            radius: 32.r,
            backgroundImage: const NetworkImage(
                'https://t4.ftcdn.net/jpg/03/85/50/01/360_F_385500115_T8QiYsPeliQ5tE3npwOuJNUfunqFBo1U.jpg'), //AssetImage loads image URL.
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  EvaIcons.bellOutline,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GreetingsWidget(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const SearchInputWidget(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const LabelWidget(
                    label: 'Category offer',
                    darkWhite: DarkWhite.dark,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const CategoryOffer(),
                  SizedBox(
                    height: 22.h,
                  ),
                ],
              ),
            ),
            BottomPanel(
                width: 375,
                height: 404,
                bottomPanelListWidgets: bottomPanelListWidgets)
          ],
        ),
      ),
    );
  }
}
