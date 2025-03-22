import 'package:flutter/material.dart';

import 'package:menu_loyalty/app/core/config/size_config.dart';

class GreenBottomButton extends StatelessWidget {
  const GreenBottomButton({
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
          style: designStyleText.titleLarge!
              .copyWith(fontSize: 17, color: designColorScheme.onPrimary),
        ),
      ),
    );
  }
}
