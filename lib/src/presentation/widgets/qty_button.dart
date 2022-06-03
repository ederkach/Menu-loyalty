import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Container(
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      height: 24.h,
      width: 24.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5.r),
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
