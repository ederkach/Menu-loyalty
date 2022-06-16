import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';

class GreenSmallButton extends StatelessWidget {
  const GreenSmallButton({
    required this.isSelected,
    required this.title,
    Key? key,
  }) : super(key: key);

  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return Container(
      height: sizer.hwt(56),
      width: sizer.w(131),
      padding: EdgeInsets.symmetric(vertical: sizer.w(10)),
      child: Center(
        child: Text(
          title,
          style: (isSelected == true)
              ? designStyleText.bodyMedium
                  ?.copyWith(color: designColorScheme.onPrimary, fontSize: 13)
              : designStyleText.bodyMedium?.copyWith(
                  color: designColorScheme.onSecondary.withOpacity(0.5),
                  fontSize: 13),
        ),
      ),
      decoration: BoxDecoration(
        color: (isSelected == true)
            ? designColorScheme.secondary
            : designColorScheme.secondaryContainer,
        borderRadius: const BorderRadius.all(Radius.circular(32)),
        boxShadow: isSelected == true
            ? const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0),
                )
              ]
            : null,
      ),
    );
  }
}
