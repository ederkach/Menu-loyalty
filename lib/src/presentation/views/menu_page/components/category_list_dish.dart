import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';

import '../../../../data/models/menu_model/menu_model.dart';
import '../widgets/category_dish_item.dart';

class CategoryListDish extends StatefulWidget {
  const CategoryListDish({
    required this.scrollcontroller,
    required this.listMenu,
    Key? key,
  }) : super(key: key);

  final ScrollController scrollcontroller;
  final List<MenuModel>? listMenu;

  @override
  State<CategoryListDish> createState() => _CategoryListDishState();
}

class _CategoryListDishState extends State<CategoryListDish> {
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
        controller: widget.scrollcontroller,
        scrollDirection: Axis.vertical,
        itemCount: widget.listMenu!.length,
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: designColorScheme.onPrimary,
          height: sizer.hwt(10),
        ),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: GestureDetector(
              onTap: (() {
                Navigator.pushNamed(context, 'DishPage');
              }),
              child: CategoryDishItem(
                menuModel: widget.listMenu![index],
              ),
            ),
          );
        },
      ),
    );
  }
}
