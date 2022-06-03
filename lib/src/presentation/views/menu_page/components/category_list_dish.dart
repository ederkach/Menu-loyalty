import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_dish_item.dart';

class CategoryListDish extends StatefulWidget {
  const CategoryListDish({
    required this.scrollcontroller,
    Key? key,
  }) : super(key: key);

  final ScrollController scrollcontroller;

  @override
  State<CategoryListDish> createState() => _CategoryListDishState();
}

class _CategoryListDishState extends State<CategoryListDish> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.only(top: 0, bottom: 30.h),
        //physics: const NeverScrollableScrollPhysics(),
        controller: widget.scrollcontroller,
        scrollDirection: Axis.vertical,
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: Theme.of(context).colorScheme.onPrimary,
          height: 10.h,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: GestureDetector(
              onTap: (() {
                Navigator.pushNamed(context, 'MenuDishPage');
              }),
              child: const CategoryDishItem(),
            ),
          );
        },
      ),
    );
  }
}
