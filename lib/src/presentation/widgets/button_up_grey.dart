import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonUpGrey extends StatelessWidget {
  const ButtonUpGrey({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        EvaIcons.arrowheadUp,
        color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.5),
        size: 24.sp,
      ),
      width: 123.w,
      height: 36.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.all(
          Radius.circular(24.r),
        ),
      ),
    );
  }
}