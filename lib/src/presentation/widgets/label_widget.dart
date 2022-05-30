import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dot_widget.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style:
              Theme.of(context).textTheme.headline6!.copyWith(fontSize: 16.sp),
        ),
        Row(
          children: [
            const DotWidget(
              green: true,
              withOpacity: 1,
            ),
            SizedBox(
              width: 8.w,
            ),
            const DotWidget(
              green: true,
              withOpacity: 0.5,
            ),
          ],
        ),
      ],
    );
  }
}