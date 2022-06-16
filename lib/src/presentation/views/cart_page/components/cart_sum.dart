import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';

import '../../../../constants/enums.dart';
import '../../../widgets/green_bottom_button.dart';
import '../../../widgets/label_widget.dart';

class CartSum extends StatelessWidget {
  const CartSum({required this.payNow, Key? key}) : super(key: key);

  final Function payNow;

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
          const LabelWidget(
            label: 'Payment detail',
            darkWhite: DarkWhite.white,
          ),
          SizedBox(
            height: sizer.hwt(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal ( 3 items)',
                style: designStyleText.bodyText1!.copyWith(
                    fontSize: 15,
                    color:
                        designColorScheme.secondaryContainer.withOpacity(0.7)),
              ),
              Text(
                '\$ 153,00',
                style: designStyleText.bodyMedium!.copyWith(
                    fontSize: 15,
                    color:
                        designColorScheme.secondaryContainer.withOpacity(0.7)),
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
                'Delivery',
                style: designStyleText.bodyMedium!.copyWith(
                    fontSize: 15,
                    color:
                        designColorScheme.secondaryContainer.withOpacity(0.7)),
              ),
              Text(
                '\$ 10,00',
                style: designStyleText.bodyMedium!.copyWith(
                    fontSize: 15,
                    color:
                        designColorScheme.secondaryContainer.withOpacity(0.7)),
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
                'Total Prices',
                style: designStyleText.headline6!
                    .copyWith(fontSize: 15, color: designColorScheme.onPrimary),
              ),
              Text(
                '\$ 163,00',
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
                  payNow(),
                }),
            child: const GreenBottomButton(
              title: 'Pay Now',
            ),
          )
        ],
      ),
    );
  }
}
