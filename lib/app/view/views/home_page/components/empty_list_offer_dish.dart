import 'package:flutter/material.dart';
import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:menu_loyalty/app/data/models/models.dart';
import 'package:menu_loyalty/app/view/widgets/dish_item_positioned.dart';

class EmptyListOffer extends StatelessWidget {
  const EmptyListOffer({required this.name, Key? key}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var sizer = MediaQuery.of(context);

    return Padding(
      padding: EdgeInsets.only(top: sizer.hwt(20)),
      child: SizedBox(
        width: sizer.w(327),
        height: sizer.hwt(206),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          separatorBuilder: (BuildContext context, int index) =>
              VerticalDivider(
            color: designColorScheme.primary,
            width: sizer.w(17),
          ),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: DishItemPositioned(
                isSelected: (index == 0) ? true : false,
                menuModel: MenuModel(name: name, imagePath: ''),
              ),
            );
          },
        ),
      ),
    );
  }
}
