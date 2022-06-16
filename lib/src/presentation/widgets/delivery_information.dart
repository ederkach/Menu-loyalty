import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';

class DeliveryInformation extends StatelessWidget {
  const DeliveryInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return Container(
      height: sizer.hwt(80),
      width: sizer.w(327),
      padding: EdgeInsets.symmetric(
        vertical: sizer.w(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: sizer.w(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: sizer.hwt(48),
                  width: sizer.w(48),
                  child:
                      Icon(EvaIcons.pin, color: designColorScheme.onSecondary),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: designColorScheme.secondary,
                  ),
                ),
                SizedBox(
                  width: sizer.w(20),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Andika ( +639384959 )',
                      style: designStyleText.bodyMedium?.copyWith(
                          color: designColorScheme.onSecondary, fontSize: 15),
                    ),
                    Row(
                      children: [
                        Text(
                          'Jalan Pancasila No.1, DIY',
                          style: designStyleText.bodyMedium?.copyWith(
                              color: designColorScheme.onSecondary
                                  .withOpacity(0.5),
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Icon(EvaIcons.editOutline, color: designColorScheme.onSecondary),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: designColorScheme.secondaryContainer,
        borderRadius: const BorderRadius.all(Radius.circular(32)),
      ),
    );
  }
}
