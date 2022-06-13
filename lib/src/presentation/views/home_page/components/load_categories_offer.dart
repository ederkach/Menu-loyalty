import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/categories_offer_model/categories_offer_model.dart';
import '../../../widgets/icon_menu_button.dart';

class LoadCategoriesOffer extends StatelessWidget {
  const LoadCategoriesOffer({required this.nameIcon, Key? key})
      : super(key: key);

  final String nameIcon;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 2,
      separatorBuilder: (BuildContext context, int index) => VerticalDivider(
        color: designColorScheme.onPrimary,
        width: 17.w,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: (() {}),
            child: IconMenuButton(
                categoriesOffer: CategoriesOffer(
                    name: nameIcon, iconPath: 'assets/icons/loadingIcon.png'),
                dotColor: designColorScheme.onSecondary,
                isSelected: (index == 0) ? true : false));
      },
    );
  }
}
