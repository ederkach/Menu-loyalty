import 'package:flutter/material.dart';

import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:menu_loyalty/app/core/constants/enums.dart';

class BadgeStatusOrder extends StatelessWidget {
  const BadgeStatusOrder({
    required this.statusOrder,
    Key? key,
  }) : super(key: key);

  final StatusOrder statusOrder;

  @override
  Widget build(BuildContext context) {
    var sizer = MediaQuery.of(context);
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
      right: sizer.w(10),
      child: Container(
        height: sizer.hwt(35),
        width: sizer.w(88),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 13, color: color),
          ),
        ),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
    );
  }
}
