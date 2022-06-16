import 'package:flutter/material.dart';
import 'package:menu_loyalty/src/config/size_config.dart';
import 'package:menu_loyalty/src/constants/enums.dart';

import 'item_payment.dart';

class ChoosePayment extends StatefulWidget {
  const ChoosePayment({
    Key? key,
  }) : super(key: key);

  @override
  State<ChoosePayment> createState() => _ChoosePaymentState();
}

class _ChoosePaymentState extends State<ChoosePayment> {
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
      padding: EdgeInsets.symmetric(
        vertical: sizer.hwt(20),
      ),
      child: SizedBox(
        height: sizer.hwt(106),
        width: sizer.w(327),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
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
                }),
                child: ItemPayment(
                  isSelected: (index == _selectedIndex) ? true : false,
                  typePayment:
                      (index == 0) ? TypePayment.cash : TypePayment.card,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
