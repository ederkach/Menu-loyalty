import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:menu_loyalty/app/core/constants/enums.dart';
import 'package:menu_loyalty/app/view/widgets/label_widget.dart';
import 'package:menu_loyalty/app/view/widgets/search_input_widget.dart';
import 'package:menu_loyalty/l10n/l10n.dart';

import 'components/control_category_offer.dart';
import 'components/greetings_widget.dart';
import 'components/home_bottom_panel.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizer = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: sizer.w(24)),
          child: const CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(
                'https://t4.ftcdn.net/jpg/03/85/50/01/360_F_385500115_T8QiYsPeliQ5tE3npwOuJNUfunqFBo1U.jpg'), //AssetImage loads image URL.
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: sizer.w(24)),
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
              padding: EdgeInsets.symmetric(horizontal: sizer.w(24)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GreetingsWidget(),
                  SizedBox(
                    height: sizer.hwt(20),
                  ),
                  const SearchInputWidget(),
                  SizedBox(
                    height: sizer.hwt(20),
                  ),
                  LabelWidget(
                    label: context.l10n.categoryOfferLabel,
                    darkWhite: DarkWhite.dark,
                  ),
                  SizedBox(
                    height: sizer.hwt(20),
                  ),
                  const ControlCategoryOffer(),
                  SizedBox(
                    height: sizer.hwt(22),
                  ),
                ],
              ),
            ),
            const HomeBottomPanel()
          ],
        ),
      ),
    );
  }
}
