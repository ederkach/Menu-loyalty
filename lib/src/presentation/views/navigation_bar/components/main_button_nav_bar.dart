import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';

class MainButtonNabBar extends StatelessWidget {
  const MainButtonNabBar({
    Key? key,
    required this.pageIndex,
    required this.evaIcons,
    required this.title,
  }) : super(key: key);

  final int pageIndex;
  final IconData evaIcons;
  final String title;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return Container(
      width: sizer.w(120),
      height: sizer.hwt(49),
      decoration: BoxDecoration(
          color: designColorScheme.secondary,
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0),
            )
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: sizer.w(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              evaIcons,
              color: designColorScheme.onPrimary,
              size: 24,
            ),
            Text(
              title,
              style: designStyleText.bodyMedium
                  ?.copyWith(color: designColorScheme.onPrimary, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
