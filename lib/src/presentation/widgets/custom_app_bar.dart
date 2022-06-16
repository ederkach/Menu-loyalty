import 'package:flutter/material.dart';
import 'package:menu_loyalty/src/config/size_config.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    this.title,
    this.iconLeading,
    this.actionsWidgets,
    Key? key,
  }) : super(key: key);

  final String? title;
  final IconData? iconLeading;
  final IconData? actionsWidgets;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      leading: Padding(
        padding: EdgeInsets.only(
          left: sizer.w(10),
        ),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            iconLeading!,
          ),
        ),
      ),
      title: Text(
        title!,
        style: designStyleText.headlineMedium
            ?.copyWith(color: designColorScheme.onSecondary, fontSize: 17),
      ),
      centerTitle: true,
    );
  }
}
