import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonUpDark extends StatelessWidget {
  const ButtonUpDark({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        EvaIcons.arrowheadUp,
        color: Theme.of(context).colorScheme.onSecondary,
        size: 24.sp,
      ),
      width: 123.w,
      height: 36.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background.withOpacity(0.1),
        borderRadius: BorderRadius.all(
          Radius.circular(24.r),
        ),
      ),
    );
  }
}
