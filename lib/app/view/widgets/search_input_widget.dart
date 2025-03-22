import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:menu_loyalty/app/core/config/size_config.dart';

class SearchInputWidget extends StatelessWidget {
  const SearchInputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return SizedBox(
      height: sizer.hwt(56),
      width: sizer.w(327),
      child: TextField(
        style: TextStyle(color: designColorScheme.onSecondary),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(28),
          ),
          hintText: 'Restaurant, food & drinks',
          hintStyle: designStyleText.titleMedium?.copyWith(fontSize: 16),
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
