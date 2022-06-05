import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import '../../../config/size_config.dart';
import 'components/description.dart';
import 'components/qty.dart';
import 'components/spec.dart';
import 'components/title_dish.dart';
import 'components/total_with_button.dart';

class MenuDishPage extends StatelessWidget {
  static const String routeName = 'MenuDishPage';

  const MenuDishPage({Key? key}) : super(key: key);

  static Route route() {
    return PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        pageBuilder: (_, __, ___) => const MenuDishPage());
  }

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: designColorScheme.primary,
      appBar: AppBar(
        backgroundColor: designColorScheme.primary,
        leading: Padding(
          padding: EdgeInsets.only(left: sizer.getProportionateScreenWidth(10)),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              EvaIcons.arrowIosBackOutline,
              color: designColorScheme.onPrimary,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              EvaIcons.shareOutline,
              color: designColorScheme.onPrimary,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(right: sizer.getProportionateScreenWidth(24)),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                EvaIcons.heartOutline,
                color: designColorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: sizer.getProportionateScreenHeightWithoutTop(72),
            right: 0,
            child: SizedBox(
              height: sizer.getProportionateScreenHeightWithoutTop(320),
              child: const Image(
                image: AssetImage("assets/images/FlourBackground.png"),
              ),
            ),
          ),
          TitleDish(
              designStyleText: designStyleText,
              designColorScheme: designColorScheme),
          Positioned(
            bottom: 0,
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(
                    top: sizer.getProportionateScreenHeightWithoutTop(22),
                    left: sizer.getProportionateScreenWidth(24),
                    right: sizer.getProportionateScreenWidth(24)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpecDishWidget(
                          designStyleText: designStyleText,
                          designColorScheme: designColorScheme),
                      DescriptionWidget(
                          designStyleText: designStyleText,
                          designColorScheme: designColorScheme),
                      QtyWidget(
                          designStyleText: designStyleText,
                          designColorScheme: designColorScheme),
                      TotalWithButtonWidget(
                          designStyleText: designStyleText,
                          designColorScheme: designColorScheme),
                    ]),
              ),
              height: sizer.getProportionateScreenHeightWithoutTop(484),
              width: sizer.getProportionateScreenWidth(375),
              decoration: BoxDecoration(
                color: designColorScheme.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
            ),
          ),
          Positioned(
            left: sizer.getProportionateScreenWidth(98),
            top: sizer.getProportionateScreenHeightWithoutTop(170),
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/menubonus.appspot.com/o/Replace%20images4.png?alt=media&token=9c18bdee-5c4d-40ce-8d05-4ee61caa7a68',
              width: sizer.getProportionateScreenWidth(185),
              height: sizer.getProportionateScreenWidth(185),
            ),
          ),
        ],
      ),
    );
  }
}
