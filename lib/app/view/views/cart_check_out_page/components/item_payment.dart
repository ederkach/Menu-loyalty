import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:menu_loyalty/app/core/constants/enums.dart';

class ItemPayment extends StatelessWidget {
  const ItemPayment({
    required this.isSelected,
    required this.typePayment,
    Key? key,
  }) : super(key: key);

  final bool isSelected;
  final TypePayment typePayment;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return Container(
      height: sizer.hwt(101),
      width: sizer.w(155),
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Container(
            height: sizer.hwt(101),
            width: sizer.w(155),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  (typePayment == TypePayment.cash)
                      ? EvaIcons.giftOutline
                      : EvaIcons.creditCardOutline,
                  color: (isSelected == true)
                      ? designColorScheme.onPrimary
                      : designColorScheme.onPrimary.withValues(alpha: 0.5),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\$15,45',
                      style: designStyleText.bodyMedium?.copyWith(
                          color: designColorScheme.onPrimary, fontSize: 15),
                    ),
                    Text(
                      (typePayment == TypePayment.cash) ? 'Cash' : 'Card',
                      style: designStyleText.bodyMedium?.copyWith(
                          color: designColorScheme.onPrimary, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: (isSelected == true)
                  ? designColorScheme.onSecondary.withValues(alpha: 0.1)
                  : designColorScheme.surface.withValues(alpha: 0.1),
              borderRadius: const BorderRadius.all(
                Radius.circular(24),
              ),
            ),
          ),
          if (isSelected == true)
            Positioned(
              right: sizer.w(10),
              top: sizer.hwt(10),
              child: Icon(EvaIcons.checkmarkCircle2,
                  color: designColorScheme.secondary),
            )
        ],
      ),
    );
  }
}
