import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
    required this.designStyleText,
    required this.designColorScheme,
  }) : super(key: key);

  final TextTheme designStyleText;
  final ColorScheme designColorScheme;

  @override
  Widget build(BuildContext context) {
    var sizer = MediaQuery.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Descriptions',
          maxLines: 1,
          style: designStyleText.displayMedium!
              .copyWith(fontSize: 20, color: designColorScheme.onSecondary),
        ),
        SizedBox(
          height: sizer.hwt(15),
        ),
        Text(
          'Get 50% off discount on the cookied vegan with sweat cookies and try connected for further discount',
          maxLines: 3,
          style: designStyleText.displayMedium!.copyWith(
              fontSize: 15,
              color: designColorScheme.onSecondary.withOpacity(0.6)),
        ),
      ],
    );
  }
}
