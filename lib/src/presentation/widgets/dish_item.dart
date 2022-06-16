import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';

import '../../data/models/menu_model/menu_model.dart';

class DishItem extends StatelessWidget {
  const DishItem({
    required this.isSelected,
    required this.menuModel,
    Key? key,
  }) : super(key: key);

  final bool isSelected;
  final MenuModel menuModel;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return Container(
      height: sizer.hwt(206),
      width: sizer.w(155),
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Positioned(
            bottom: sizer.hwt(38),
            left: sizer.w(15),
            child: SizedBox(
              height: sizer.hwt(36),
              width: sizer.w(110),
              child: Text(
                menuModel.name,
                maxLines: 2,
                style: designStyleText.bodyMedium?.copyWith(
                    color: designColorScheme.onPrimary, fontSize: 13),
              ),
            ),
          ),
          Positioned(
            bottom: sizer.hwt(10),
            left: sizer.w(15),
            child: Text(
              '\$51',
              style: designStyleText.bodyMedium
                  ?.copyWith(color: designColorScheme.secondary, fontSize: 15),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: sizer.w(155),
              height: sizer.hwt(135),
              decoration: BoxDecoration(
                color: (isSelected == true)
                    ? designColorScheme.onSecondary.withOpacity(0.1)
                    : designColorScheme.background.withOpacity(0.1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(24),
                ),
              ),
            ),
          ),
          Positioned(
              right: 0,
              child: (menuModel.imagePath.toString() != '')
                  ? Image.network(
                      menuModel.imagePath.toString(),
                      width: sizer.w(116),
                      height: sizer.hwt(116),
                    )
                  : CircularProgressIndicator(
                      color: designColorScheme.onSecondary,
                    )),
        ],
      ),
    );
  }
}
