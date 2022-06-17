import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:menu_loyalty/src/config/size_config.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var sizer = MediaQuery.of(context);
    return Container(
      height: sizer.w(72),
      width: sizer.w(72),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          EvaIcons.homeOutline,
          color: designColorScheme.onPrimary,
        ),
      ),
      decoration: BoxDecoration(
        color: designColorScheme.primary,
        borderRadius: const BorderRadius.all(
          Radius.circular(26),
        ),
      ),
    );
  }
}
