import 'package:flutter/material.dart';
import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:menu_loyalty/app/data/models/models.dart';
import 'package:menu_loyalty/app/view/app_router/mobile/app_router.dart';

import 'cart_list_item.dart';

class CartList extends StatefulWidget {
  const CartList({
    required this.cart,
    Key? key,
  }) : super(key: key);

  final Cart cart;

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
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
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: widget.cart.menuItems.length,
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: designColorScheme.surface,
        height: sizer.hwt(30),
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: (() {
            selectIndex(index);
            DishRoute(widget.cart.menuItems[index].id ?? '',
                    widget.cart.menuItems[index])
                .push(context);
          }),
          child: CartListItem(
            menuModel: widget.cart.menuItems[index],
          ),
        );
      },
    );
  }
}
