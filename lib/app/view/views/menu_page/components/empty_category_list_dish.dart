import 'package:flutter/material.dart';
import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:menu_loyalty/app/data/models/models.dart';
import 'package:menu_loyalty/app/view/views/menu_page/widgets/category_dish_item.dart';

class EmptyCategoryListDish extends StatelessWidget {
  const EmptyCategoryListDish({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var sizer = MediaQuery.of(context);
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.only(
          top: 0,
          bottom: sizer.hwt(30),
        ),
        scrollDirection: Axis.vertical,
        itemCount: 6,
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: designColorScheme.onPrimary,
          height: sizer.hwt(10),
        ),
        itemBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: CategoryDishItem(
              menuModel: MenuModel(name: '........'),
            ),
          );
        },
      ),
    );
  }
}
