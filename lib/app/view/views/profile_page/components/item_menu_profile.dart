import 'package:flutter/material.dart';

import 'package:menu_loyalty/app/core/config/size_config.dart';

class ItemMenuProfile extends StatelessWidget {
  const ItemMenuProfile({
    required this.evaIcons,
    required this.onSubtitle,
    required this.title,
    required this.subTitle,
    required this.redColor,
    Key? key,
  }) : super(key: key);

  final IconData evaIcons;
  final bool onSubtitle;
  final String title;
  final String subTitle;
  final bool redColor;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return Container(
      height: sizer.hwt(91),
      width: sizer.w(327),
      decoration: BoxDecoration(
          color: (!redColor)
              ? designColorScheme.secondaryContainer
              : designColorScheme.error.withValues(alpha: 0.1),
          borderRadius: const BorderRadius.all(Radius.circular(32))),
      child: Row(
        children: [
          SizedBox(
            width: sizer.w(20),
          ),
          Container(
            height: sizer.w(48),
            width: sizer.w(48),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (!redColor)
                  ? designColorScheme.primary
                  : designColorScheme.error,
            ),
            child: Icon(
              evaIcons,
              color: designColorScheme.surface,
            ),
          ),
          SizedBox(
            width: sizer.w(20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                  style: designStyleText.bodyLarge?.copyWith(
                      fontSize: 17,
                      color: (!redColor)
                          ? designColorScheme.onSecondary
                          : designColorScheme.error)),
              if (onSubtitle == true)
                Text(
                  subTitle,
                  style: (!redColor)
                      ? designStyleText.bodyMedium?.copyWith(
                          fontSize: 13,
                          color: designColorScheme.onSecondary
                              .withValues(alpha: 0.5))
                      : designStyleText.bodyMedium?.copyWith(
                          fontSize: 13, color: designColorScheme.error),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
