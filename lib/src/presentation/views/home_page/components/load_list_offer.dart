import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/menu_model/menu_model.dart';
import '../../../widgets/dish_item.dart';

class LoadListOffer extends StatelessWidget {
  const LoadListOffer({required this.name, Key? key}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.only(top: 20.0.h),
      child: SizedBox(
        width: 327.w,
        height: 206.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          separatorBuilder: (BuildContext context, int index) =>
              VerticalDivider(
            color: designColorScheme.primary,
            width: 17.w,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: DishItem(
                isSelected: (index == 0) ? true : false,
                menuModel: MenuModel(name: name, imagePath: ''),
              ),
            );
          },
        ),
      ),
    );
  }
}
