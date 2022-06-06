import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/cart_list_item.dart';

class CartList extends StatefulWidget {
  const CartList({
    Key? key,
  }) : super(key: key);

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
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: Theme.of(context).colorScheme.background,
        height: 30.w,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: (() {
            selectIndex(index);
          }),
          child: const CartListItem(),
        );
      },
    );
  }
}
