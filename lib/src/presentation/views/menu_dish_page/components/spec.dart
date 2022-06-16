import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';

class SpecDishWidget extends StatelessWidget {
  const SpecDishWidget({
    Key? key,
    required this.designStyleText,
    required this.designColorScheme,
  }) : super(key: key);

  final TextTheme designStyleText;
  final ColorScheme designColorScheme;

  @override
  Widget build(BuildContext context) {
    var sizer = MediaQuery.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: sizer.h(126),
          width: sizer.w(72),
          child: Padding(
            padding: EdgeInsets.all(
              sizer.w(6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '🔥 kkal 150',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: designStyleText.bodyMedium!.copyWith(
                      fontSize: 14, color: designColorScheme.onPrimary),
                ),
                Text(
                  'Weight 100gr',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: designStyleText.bodyMedium!.copyWith(
                      fontSize: 13, color: designColorScheme.onPrimary),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: designColorScheme.primary,
            borderRadius: const BorderRadius.all(
              Radius.circular(26),
            ),
          ),
        ),
      ],
    );
  }
}
