import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';
import 'package:menu_loyalty/src/data/models/menu_model/menu_model.dart';

import '../../../widgets/dish_item_centre.dart';

class CategoryListOffer extends StatefulWidget {
  const CategoryListOffer({
    required this.listMenuOffer,
    Key? key,
  }) : super(key: key);

  final List<MenuModel>? listMenuOffer;

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
    var sizer = MediaQuery.of(context);
    return SizedBox(
      height: sizer.hwt(155),
      width: sizer.w(334),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.listMenuOffer!.length,
        separatorBuilder: (BuildContext context, int index) => VerticalDivider(
          color: designColorScheme.onPrimary,
          width: sizer.w(15),
        ),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: GestureDetector(
              onTap: (() {
                selectIndex(index);
                Navigator.pushNamed(context, 'DishPage',
                    arguments: widget.listMenuOffer![index]);
              }),
              child: DishItemCentre(
                  menuModel: widget.listMenuOffer![index],
                  isSelected: (index == _selectedIndex) ? true : false),
            ),
          );
        },
      ),
    );
  }
}
