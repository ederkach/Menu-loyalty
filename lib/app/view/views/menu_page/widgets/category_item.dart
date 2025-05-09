import 'package:flutter/material.dart';

import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:menu_loyalty/app/data/models/models.dart';
import 'package:menu_loyalty/app/view/widgets/dot_widget.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    required this.isSelected,
    required this.categoriesModel,
    Key? key,
  }) : super(key: key);

  final bool isSelected;
  final Categories categoriesModel;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return SizedBox(
        width: sizer.w(100),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(categoriesModel.name,
                  style: (isSelected)
                      ? designStyleText.bodyMedium!.copyWith(fontSize: 14)
                      : designStyleText.bodyMedium!.copyWith(
                          fontSize: 14,
                          color: designColorScheme.onSecondary
                              .withValues(alpha: 0.5))),
            ),
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
