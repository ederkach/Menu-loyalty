import 'package:flutter/material.dart';
import 'package:menu_loyalty/src/config/size_config.dart';

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
    var designColorScheme = Theme.of(context).colorScheme;
    var sizer = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(
        top: sizer.hwt(20),
      ),
      child: SizedBox(
        width: sizer.w(327),
        height: sizer.hwt(206),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: widget.listMenu.length,
          separatorBuilder: (BuildContext context, int index) =>
              VerticalDivider(
            color: designColorScheme.primary,
            width: sizer.w(17),
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
