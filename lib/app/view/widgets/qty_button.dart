import 'package:flutter/material.dart';

import 'package:menu_loyalty/app/core/config/size_config.dart';

class QtyButton extends StatelessWidget {
  const QtyButton({
    required this.title,
    required this.background,
    Key? key,
  }) : super(key: key);

  final String title;
  final Color background;

  @override
  Widget build(BuildContext context) {
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return Container(
      child: Center(
        child: Text(
          title,
          style: designStyleText.bodyMedium!.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      height: sizer.hwt(24),
      width: sizer.w(24),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        color: background,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1.0,
            spreadRadius: 0.0,
            offset: Offset(1.0, 1.0),
          )
        ],
      ),
    );
  }
}
