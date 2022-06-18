import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';
import 'package:menu_loyalty/src/data/models/menu_model/menu_model.dart';

import '../../../widgets/dish_item_centre.dart';

class EmptyCategoryListOffer extends StatelessWidget {
  const EmptyCategoryListOffer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var sizer = MediaQuery.of(context);
    return SizedBox(
      height: sizer.hwt(155),
      width: sizer.w(334),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        separatorBuilder: (BuildContext context, int index) => VerticalDivider(
          color: designColorScheme.onPrimary,
          width: sizer.w(15),
        ),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: DishItemCentre(
                menuModel: const MenuModel(name: '.......'),
                isSelected: (index == 0) ? true : false),
          );
        },
      ),
    );
  }
}
