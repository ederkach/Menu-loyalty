import 'package:flutter/material.dart';

import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:menu_loyalty/app/core/constants/enums.dart';
import 'package:menu_loyalty/app/data/models/models.dart';
import 'package:menu_loyalty/app/view/widgets/green_bottom_button.dart';
import 'package:menu_loyalty/app/view/widgets/label_widget.dart';
import 'package:menu_loyalty/l10n/l10n.dart';

class CartSum extends StatelessWidget {
  const CartSum({required this.payNow, required this.cart, Key? key})
      : super(key: key);

  final Function payNow;
  final Cart cart;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: sizer.w(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: sizer.hwt(20),
          ),
          LabelWidget(
            label: context.l10n.paymentDetailLabel,
            darkWhite: DarkWhite.white,
          ),
          SizedBox(
            height: sizer.hwt(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.subtotalText(cart.quantity.toString()),
                style: designStyleText.bodyLarge!.copyWith(
                    fontSize: 15,
                    color: designColorScheme.secondaryContainer
                        .withValues(alpha: 0.7)),
              ),
              Text(
                '\$${cart.subtotal.toString()}',
                style: designStyleText.bodyMedium!.copyWith(
                    fontSize: 15,
                    color: designColorScheme.secondaryContainer
                        .withValues(alpha: 0.7)),
              ),
            ],
          ),
          SizedBox(
            height: sizer.hwt(5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.deliveryText,
                style: designStyleText.bodyMedium!.copyWith(
                    fontSize: 15,
                    color: designColorScheme.secondaryContainer
                        .withValues(alpha: 0.7)),
              ),
              Text(
                '\$ 0,0',
                style: designStyleText.bodyMedium!.copyWith(
                    fontSize: 15,
                    color: designColorScheme.secondaryContainer
                        .withValues(alpha: 0.7)),
              ),
            ],
          ),
          SizedBox(
            height: sizer.hwt(5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.totalPricesTitle,
                style: designStyleText.titleLarge!
                    .copyWith(fontSize: 15, color: designColorScheme.onPrimary),
              ),
              Text(
                '\$${cart.subtotal.toString()}',
                style: designStyleText.titleLarge!
                    .copyWith(color: designColorScheme.secondary),
              ),
            ],
          ),
          SizedBox(
            height: sizer.hwt(20),
          ),
          GestureDetector(
            onTap: (() => {
                  (cart.subtotal > 0) ? payNow() : Navigator.of(context).pop(),
                }),
            child: GreenBottomButton(
              title: (cart.subtotal > 0)
                  ? context.l10n.payNowButton
                  : context.l10n.startExploringButton,
            ),
          )
        ],
      ),
    );
  }
}
