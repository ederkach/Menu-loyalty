import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';

class SpecDishWidget extends StatelessWidget {
  const SpecDishWidget({
    required this.kkal,
    required this.weight,
    Key? key,
  }) : super(key: key);

  final String kkal;
  final String weight;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
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
                  '🔥 kkal $kkal',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: designStyleText.bodyMedium!.copyWith(
                      fontSize: 14, color: designColorScheme.onPrimary),
                ),
                Text(
                  'Weight ${weight}gr',
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
