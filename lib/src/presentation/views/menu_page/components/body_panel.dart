import 'package:flutter/material.dart';
import 'package:menu_loyalty/src/config/size_config.dart';

class BodyPanel extends StatelessWidget {
  const BodyPanel({
    Key? key,
    required this.childWidget,
  }) : super(key: key);

  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var sizer = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(
        top: sizer.hwt(50),
      ),
      child: Container(
        height: sizer.hwt(800),
        width: sizer.w(375),
        decoration: BoxDecoration(
          color: designColorScheme.onPrimary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: sizer.w(24),
          ),
          child: childWidget,
        ),
      ),
    );
  }
}
