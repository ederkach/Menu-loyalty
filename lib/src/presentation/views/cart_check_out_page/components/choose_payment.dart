import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0.h),
      child: SizedBox(
        height: 106.h,
        width: 327.w,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
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
