import 'package:flutter/material.dart';
import 'package:menu_loyalty/src/config/size_config.dart';

import '../../../../data/models/menu_model/menu_model.dart';
import 'description.dart';
import 'qty.dart';
import 'spec.dart';
import 'total_with_button.dart';

class BottomDishPanel extends StatelessWidget {
  const BottomDishPanel({
    required this.menuModel,
    Key? key,
  }) : super(key: key);

  final MenuModel menuModel;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var sizer = MediaQuery.of(context);
    return Positioned(
      bottom: 0,
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(
              top: sizer.hwt(22), left: sizer.w(24), right: sizer.w(24)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpecDishWidget(
                  kkal: menuModel.kkal.toString(),
                  weight: menuModel.weight.toString(),
                ),
                DescriptionWidget(
                    description: menuModel.description.toString()),
                const QtyWidget(),
                TotalWithButtonWidget(
                  menuModel: menuModel,
                ),
              ]),
        ),
        height: sizer.h(475),
        width: sizer.w(375),
        decoration: BoxDecoration(
          color: designColorScheme.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
      ),
    );
  }
}
