import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/enums.dart';
import 'dot_widget.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({Key? key, required this.label, required this.darkWhite})
      : super(key: key);

  final String label;
  final Enum darkWhite;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: (darkWhite == DarkWhite.dark)
              ? designStyleText.headline6!.copyWith(fontSize: 16.sp)
              : designStyleText.headline6!.copyWith(
                  fontSize: 16.sp, color: designColorScheme.onPrimary),
        ),
        Row(
          children: [
            DotWidget(
              dotColor: designColorScheme.secondary,
              sizeheight: 8,
              sizewidth: 8,
            ),
            SizedBox(
              width: 8.w,
            ),
            DotWidget(
              dotColor: designColorScheme.secondary.withOpacity(0.5),
              sizeheight: 8,
              sizewidth: 8,
            ),
          ],
        ),
      ],
    );
  }
}
