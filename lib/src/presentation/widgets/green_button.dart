import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';

class GreenButton extends StatelessWidget {
  const GreenButton({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return Container(
      height: sizer.hwt(56),
      width: sizer.w(327),
      decoration: BoxDecoration(
        color: designColorScheme.secondary,
        borderRadius: const BorderRadius.all(
          Radius.circular(28),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: designStyleText.headline6!
              .copyWith(fontSize: 17, color: designColorScheme.onPrimary),
        ),
      ),
    );
  }
}
