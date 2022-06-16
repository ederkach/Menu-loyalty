import 'package:flutter/material.dart';
import 'package:menu_loyalty/src/config/size_config.dart';

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
    var sizer = MediaQuery.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: (darkWhite == DarkWhite.dark)
              ? designStyleText.headline6!.copyWith(fontSize: 16)
              : designStyleText.headline6!
                  .copyWith(fontSize: 16, color: designColorScheme.onPrimary),
        ),
        Row(
          children: [
            DotWidget(
              dotColor: designColorScheme.secondary,
              sizeheight: 8,
              sizewidth: 8,
            ),
            SizedBox(
              width: sizer.w(8),
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
