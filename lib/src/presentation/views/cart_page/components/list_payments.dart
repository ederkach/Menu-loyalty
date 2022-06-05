import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/type_payment_button.dart';

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
    return ListView.separated(
      padding: EdgeInsets.only(top: 10.h),
      scrollDirection: Axis.vertical,
      itemCount: 3,
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: Theme.of(context).colorScheme.background,
        height: 10.w,
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
