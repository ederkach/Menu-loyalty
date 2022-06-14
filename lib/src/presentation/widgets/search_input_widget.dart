import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchInputWidget extends StatelessWidget {
  const SearchInputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    return SizedBox(
      width: 327.w,
      height: 56.h,
      child: TextField(
        style: TextStyle(color: designColorScheme.onSecondary),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(28.r),
          ),
          hintText: 'Restaurant, food & drinks',
          hintStyle: designStyleText.titleMedium?.copyWith(fontSize: 16.sp),
          prefixIcon: const Icon(
            EvaIcons.searchOutline,
          ),
          suffixIcon: const Icon(
            EvaIcons.optionsOutline,
          ),
        ),
      ),
    );
  }
}
