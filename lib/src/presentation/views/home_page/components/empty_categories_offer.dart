import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/categories_offer_model/categories_offer_model.dart';
import '../../../widgets/icon_menu_button.dart';

class EmptyCategoriesOffer extends StatelessWidget {
  const EmptyCategoriesOffer({required this.nameIcon, Key? key})
      : super(key: key);

  final String nameIcon;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 2,
      separatorBuilder: (BuildContext context, int index) => VerticalDivider(
        color: Theme.of(context).colorScheme.onPrimary,
        width: 17.w,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: (() {}),
            child: IconMenuButton(
                categoriesOffer: CategoriesOffer(
                    name: nameIcon, iconPath: 'assets/icons/loadingIcon.png'),
                dotColor: Theme.of(context).colorScheme.onSecondary,
                isSelected: (index == 0) ? true : false));
      },
    );
  }
}
