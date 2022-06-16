import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:menu_loyalty/src/config/size_config.dart';

class ButtonUpGrey extends StatelessWidget {
  const ButtonUpGrey({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var sizer = MediaQuery.of(context);
    return Container(
      child: Icon(
        EvaIcons.arrowheadUp,
        color: designColorScheme.onSecondary.withOpacity(0.5),
        size: 24,
      ),
      width: sizer.w(123),
      height: sizer.hwt(46),
      decoration: BoxDecoration(
        color: designColorScheme.secondaryContainer,
        borderRadius: const BorderRadius.all(
          Radius.circular(24),
        ),
      ),
    );
  }
}
