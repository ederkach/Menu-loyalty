import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12.h,
          ),
          SizedBox(
            child: Text(
              'Salad, Vegan, Breakfast',
              style: designStyleText.displayMedium!
                  .copyWith(fontSize: 17, color: designColorScheme.secondary),
            ),
          ),
          SizedBox(
            height: 6.h,
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
