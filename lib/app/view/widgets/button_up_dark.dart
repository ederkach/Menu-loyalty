import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:menu_loyalty/app/core/config/size_config.dart';

class ButtonUpDark extends StatelessWidget {
  const ButtonUpDark({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var sizer = MediaQuery.of(context);
    return Container(
      child: Icon(
        EvaIcons.arrowheadUp,
        color: designColorScheme.onSecondary,
        size: 24,
      ),
      width: sizer.w(123),
      height: sizer.hwt(46),
      decoration: BoxDecoration(
        color: designColorScheme.surface.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(24),
        ),
      ),
    );
  }
}
