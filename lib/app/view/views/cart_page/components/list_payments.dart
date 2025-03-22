import 'package:flutter/material.dart';

import 'package:menu_loyalty/app/core/config/size_config.dart';

import 'type_payment_button.dart';

class ListPayments extends StatefulWidget {
  const ListPayments({
    Key? key,
  }) : super(key: key);

  @override
  State<ListPayments> createState() => _ListPaymentsState();
}

class _ListPaymentsState extends State<ListPayments> {
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
      padding: EdgeInsets.only(
        top: sizer.hwt(10),
      ),
      scrollDirection: Axis.vertical,
      itemCount: 3,
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: designColorScheme.surface,
        height: sizer.hwt(10),
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: (() {
            selectIndex(index);
          }),
          child: TypePaymentButton(
              isSelected: (index == _selectedIndex) ? true : false),
        );
      },
    );
  }
}
