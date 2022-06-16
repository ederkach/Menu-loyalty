import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';

class BottomPanel extends StatelessWidget {
  const BottomPanel({
    required this.width,
    required this.height,
    required this.bottomPanelListWidgets,
    required this.supportWidgets,
    required this.bottomButtonWidgets,
    Key? key,
  }) : super(key: key);

  final double width;
  final double height;
  final Widget bottomButtonWidgets;
  final Widget supportWidgets;
  final Widget bottomPanelListWidgets;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var sizer = MediaQuery.of(context);
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          top: sizer.hwt(22),
        ),
        child: Column(
          children: [
            bottomButtonWidgets,
            supportWidgets,
            bottomPanelListWidgets
          ],
        ),
      ),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: designColorScheme.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
    );
  }
}
