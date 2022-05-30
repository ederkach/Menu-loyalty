import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_offer_item.dart';

class CategoryOffer extends StatefulWidget {
  const CategoryOffer({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryOffer> createState() => _CategoryOfferState();
}

class _CategoryOfferState extends State<CategoryOffer> {
  int _selectedIndex = 0;

  void selectIndex(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      height: 92.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          separatorBuilder: (BuildContext context, int index) =>
              VerticalDivider(
                color: Theme.of(context).colorScheme.onPrimary,
                width: 17.w,
              ),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: GestureDetector(
                  onTap: (() {
                    selectIndex(index);
                  }),
                  child: CategoryOfferItem(
                      isSelected: (index == _selectedIndex) ? true : false)),
            );
          }),
    );
  }
}
