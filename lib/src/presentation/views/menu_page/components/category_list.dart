import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';

import 'category_list_item.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int _selectedIndex = 0;

  void selectIndex(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var sizer = MediaQuery.of(context);
    return SizedBox(
      height: sizer.hwt(45),
      width: sizer.w(334),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        separatorBuilder: (BuildContext context, int index) => VerticalDivider(
          color: designColorScheme.onPrimary,
          width: sizer.w(5),
        ),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: GestureDetector(
              onTap: (() {
                selectIndex(index);
              }),
              child: CategoryListItem(
                  isSelected: (index == _selectedIndex) ? true : false),
            ),
          );
        },
      ),
    );
  }
}
