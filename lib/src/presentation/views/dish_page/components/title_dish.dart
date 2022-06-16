import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';

class TitleDish extends StatelessWidget {
  const TitleDish({
    Key? key,
    required this.designStyleText,
    required this.designColorScheme,
  }) : super(key: key);

  final TextTheme designStyleText;
  final ColorScheme designColorScheme;

  @override
  Widget build(BuildContext context) {
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
          ),
          SizedBox(
            child: Text(
              'Salad, Vegan, Breakfast',
              style: designStyleText.displayMedium!
                  .copyWith(fontSize: 17, color: designColorScheme.secondary),
            ),
          ),
          SizedBox(
            height: sizer.hwt(6),
          ),
          SizedBox(
            child: Text(
              'Dragon Fruit Eggs Curry Sauce',
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
