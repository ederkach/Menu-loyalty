import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';

class TitleDish extends StatelessWidget {
  const TitleDish({
    required this.dishGroups,
    required this.dishName,
    Key? key,
  }) : super(key: key);

  final String dishGroups;
  final String dishName;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: sizer.w(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: sizer.hwt(12),
            width: sizer.w(327),
          ),
          SizedBox(
            child: Text(
              dishGroups,
              style: designStyleText.displayMedium!
                  .copyWith(fontSize: 17, color: designColorScheme.secondary),
            ),
          ),
          SizedBox(
            height: sizer.hwt(6),
          ),
          SizedBox(
            child: Text(
              dishName,
              maxLines: 2,
              style: designStyleText.displayMedium!
                  .copyWith(fontSize: 28, color: designColorScheme.onPrimary),
            ),
          ),
        ],
      ),
    );
  }
}
