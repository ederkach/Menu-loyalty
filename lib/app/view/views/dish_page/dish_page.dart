import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:menu_loyalty/app/data/models/models.dart';
import 'package:progress_indicators/progress_indicators.dart';

import 'components/bottom_dish_panel.dart';
import 'components/title_dish.dart';

class DishPage extends StatelessWidget {
  static const String routeName = 'DishPage';

  const DishPage({
    required this.menuModel,
    Key? key,
    required String id,
  }) : super(key: key);

  final MenuModel menuModel;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var sizer = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: designColorScheme.primary,
      appBar: AppBar(
        backgroundColor: designColorScheme.primary,
        leading: Padding(
          padding: EdgeInsets.only(left: sizer.w(10)),
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
            padding: EdgeInsets.only(right: sizer.w(24)),
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
            top: sizer.h(72),
            right: 0,
            child: SizedBox(
              height: sizer.h(320),
              child: const Image(
                image: AssetImage("assets/images/FlourBackground.png"),
              ),
            ),
          ),
          TitleDish(
            dishGroups: menuModel.hashtags.toString(),
            dishName: menuModel.name,
          ),
          BottomDishPanel(menuModel: menuModel),
          Positioned(
            left: sizer.w(98),
            top: sizer.h(143),
            child: CachedNetworkImage(
              imageUrl: menuModel.imagePath.toString(),
              placeholder: (context, url) => GlowingProgressIndicator(
                  child: const ImageIcon(
                      AssetImage('assets/icons/loadingIcon.png'))),
              errorWidget: (context, url, error) =>
                  const ImageIcon(AssetImage('assets/icons/loadingIcon.png')),
              width: sizer.w(165),
              height: sizer.w(165),
            ),
          ),
        ],
      ),
    );
  }
}
