import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/menu_model/menu_model.dart';
import '../../../widgets/dish_item.dart';

class ListOffer extends StatefulWidget {
  const ListOffer({
    required this.listMenu,
    Key? key,
  }) : super(key: key);

  final List<MenuModel> listMenu;

  @override
  State<ListOffer> createState() => _ListOfferState();
}

class _ListOfferState extends State<ListOffer> {
  int _selectedIndex = 0;

  void selectIndex(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0.h),
      child: SizedBox(
        width: 327.w,
        height: 206.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: widget.listMenu.length,
          separatorBuilder: (BuildContext context, int index) =>
              VerticalDivider(
            color: Theme.of(context).colorScheme.primary,
            width: 17.w,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: GestureDetector(
                onTap: (() {
                  selectIndex(index);
                  Navigator.pushNamed(context, 'MenuDishPage');
                }),
                child: DishItem(
                  isSelected: (index == _selectedIndex) ? true : false,
                  menuModel: widget.listMenu[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
