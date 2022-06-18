import 'package:flutter/material.dart';
import 'package:menu_loyalty/src/config/size_config.dart';
import 'package:menu_loyalty/src/data/models/categories_model/categories_model.dart';

import '../widgets/category_item.dart';

class EmptyCategoryList extends StatelessWidget {
  const EmptyCategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var sizer = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(
        top: sizer.hwt(20),
      ),
      child: SizedBox(
        height: sizer.hwt(45),
        width: sizer.w(334),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          separatorBuilder: (BuildContext context, int index) =>
              VerticalDivider(
            color: designColorScheme.onPrimary,
            width: sizer.w(5),
          ),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: CategoryItem(
                  categoriesModel: const Categories(name: '.......'),
                  isSelected: (index == 0) ? true : false),
            );
          },
        ),
      ),
    );
  }
}
