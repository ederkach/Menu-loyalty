import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/dish_item_centre.dart';

class CategoryListOffer extends StatefulWidget {
  const CategoryListOffer({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryListOffer> createState() => _CategoryListOfferState();
}

class _CategoryListOfferState extends State<CategoryListOffer> {
  int _selectedIndex = 0;

  void selectIndex(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: 334.w,
      height: 155.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        separatorBuilder: (BuildContext context, int index) => VerticalDivider(
          color: designColorScheme.onPrimary,
          width: 15.w,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: GestureDetector(
              onTap: (() {
                selectIndex(index);
                Navigator.pushNamed(context, 'MenuDishPage');
              }),
              child: DishItemCentre(
                  isSelected: (index == _selectedIndex) ? true : false),
            ),
          );
        },
      ),
    );
  }
}
