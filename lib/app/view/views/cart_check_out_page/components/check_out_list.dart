import 'package:flutter/material.dart';
import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:menu_loyalty/app/data/models/models.dart';

import 'check_out_list_item.dart';

class CheckOutList extends StatefulWidget {
  const CheckOutList({
    required this.cart,
    Key? key,
  }) : super(key: key);

  final Cart cart;

  @override
  State<CheckOutList> createState() => _CheckOutListState();
}

class _CheckOutListState extends State<CheckOutList> {
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
    return Expanded(
      child: ListView.separated(
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
            }),
            child: CheckOutListItem(
              menuModel: widget.cart.menuItems[index],
            ),
          );
        },
      ),
    );
  }
}
