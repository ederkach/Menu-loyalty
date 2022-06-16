import 'package:flutter/material.dart';
import 'package:menu_loyalty/src/config/size_config.dart';

import '../../../../constants/enums.dart';
import '../../../widgets/label_widget.dart';

class DeliveredTo extends StatelessWidget {
  const DeliveredTo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return Container(
      height: sizer.hwt(170),
      width: sizer.w(327),
      child: Padding(
        padding: EdgeInsets.all(
          sizer.w(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const LabelWidget(label: 'Delevered To', darkWhite: DarkWhite.dark),
            SizedBox(
              height: sizer.hwt(10),
            ),
            Row(
              children: [
                SizedBox(
                  height: sizer.w(70),
                  width: sizer.w(70),
                  child: const Image(
                    image: AssetImage("assets/images/Maps.png"),
                  ),
                ),
                SizedBox(
                  width: sizer.hwt(15),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('Andika ( +639384959 )'),
                    SizedBox(
                      height: sizer.hwt(6),
                    ),
                    Text(
                      'Jalan Pancasila No.1, DIY',
                      style: designStyleText.headlineMedium?.copyWith(
                          color: designColorScheme.onSecondary.withOpacity(0.5),
                          fontSize: 13),
                    ),
                    SizedBox(
                      height: sizer.hwt(8),
                    ),
                    Text(
                      'Est : 30 MIN',
                      style: designStyleText.headlineMedium?.copyWith(
                          color: designColorScheme.onSecondary.withOpacity(0.5),
                          fontSize: 15),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: designColorScheme.onPrimary,
        borderRadius: const BorderRadius.all(
          Radius.circular(26),
        ),
      ),
    );
  }
}
