import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';

import '../../../widgets/dot_widget.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return SizedBox(
        width: sizer.w(108),
        child: Column(
          children: [
            Text('Category',
                style: (isSelected)
                    ? designStyleText.bodyMedium!.copyWith(fontSize: 14)
                    : designStyleText.bodyMedium!.copyWith(
                        fontSize: 14,
                        color: designColorScheme.onSecondary.withOpacity(0.5))),
            SizedBox(
              height: sizer.hwt(8),
            ),
            if (isSelected)
              DotWidget(
                dotColor: designColorScheme.secondary,
                sizeheight: 7,
                sizewidth: 7,
              ),
          ],
        ));
  }
}
