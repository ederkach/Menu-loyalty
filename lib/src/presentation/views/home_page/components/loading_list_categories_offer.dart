import 'package:flutter/material.dart';
import 'package:menu_loyalty/src/config/size_config.dart';

import '../../../../data/models/categories_offer_model/categories_offer_model.dart';
import '../../../widgets/icon_menu_button.dart';

class LoadingCategoriesOffer extends StatelessWidget {
  const LoadingCategoriesOffer({required this.nameIcon, Key? key})
      : super(key: key);

  final String nameIcon;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var sizer = MediaQuery.of(context);
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 2,
      separatorBuilder: (BuildContext context, int index) => VerticalDivider(
        color: designColorScheme.onPrimary,
        width: sizer.w(17),
      ),
      itemBuilder: (BuildContext context, int index) {
        return IconMenuButton(
            categoriesOffer: CategoriesOffer(
                name: nameIcon, iconPath: 'assets/icons/loadingIcon.png'),
            dotColor: designColorScheme.onSecondary,
            isSelected: (index == 0) ? true : false);
      },
    );
  }
}
