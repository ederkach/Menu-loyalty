import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menu_loyalty/src/constants/enums.dart';

class BadgeStatusOrder extends StatelessWidget {
  const BadgeStatusOrder({
    required this.statusOrder,
    Key? key,
  }) : super(key: key);

  final StatusOrder statusOrder;

  @override
  Widget build(BuildContext context) {
    Color color;
    String title;
    if (statusOrder == StatusOrder.onGoing) {
      color = const Color(0xFFFF9800);
      title = 'On going';
    } else if (statusOrder == StatusOrder.complete) {
      color = const Color(0xFF71B24D);
      title = 'Completed';
    } else {
      color = const Color(0xFFD61B0A);
      title = 'Cancelled';
    }
    return Positioned(
      right: 10.w,
      child: Container(
        height: 35.h,
        width: 88.w,
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 13, color: color),
          ),
        ),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.all(
            Radius.circular(16.r),
          ),
        ),
      ),
    );
  }
}
