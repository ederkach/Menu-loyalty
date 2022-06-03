import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import '../../../config/theme/size_config.dart';
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

    return Scaffold(
      backgroundColor: designColorScheme.primary,
      appBar: AppBar(
        backgroundColor: designColorScheme.primary,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
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
            padding: EdgeInsets.only(right: 24.w),
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
            top: MediaQuery.of(context)
                .getProportionateScreenHeightWithoutTop(72),
            right: 0.w,
            child: SizedBox(
              height: 293.h,
              //width: 375.w,
              child: const Image(
                image: AssetImage("assets/images/flour.png"),
              ),
            ),
          ),
          TitleDish(
              designStyleText: designStyleText,
              designColorScheme: designColorScheme),
          Positioned(
            bottom: 0.h,
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(top: 22.h, left: 24.w, right: 24.w),
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
              height: MediaQuery.of(context)
                  .getProportionateScreenHeightWithoutTop(484),
              width: 375.w,
              decoration: BoxDecoration(
                color: designColorScheme.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).getProportionateScreenWidth(98),
            top: MediaQuery.of(context)
                .getProportionateScreenHeightWithoutTop(170),
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/menubonus.appspot.com/o/Replace%20images4.png?alt=media&token=9c18bdee-5c4d-40ce-8d05-4ee61caa7a68',
              width: 185.w,
              height: 185.h,
            ),
          ),
        ],
      ),
    );
  }
}
