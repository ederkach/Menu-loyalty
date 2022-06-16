import 'package:flutter/material.dart';
import 'package:menu_loyalty/src/config/size_config.dart';

import '../../../widgets/button_up_dark.dart';
import '../../../widgets/green_bottom_button.dart';
import 'choose_payment.dart';
import 'show_successful_order.dart';

class CheckOutBottomPanel extends StatelessWidget {
  const CheckOutBottomPanel({
    Key? key,
    required this.sizer,
    required this.designColorScheme,
  }) : super(key: key);

  final MediaQueryData sizer;
  final ColorScheme designColorScheme;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(
            top: sizer.hwt(22),
          ),
          child: Column(
            children: [
              const ButtonUpDark(),
              const ChoosePayment(),
              GestureDetector(
                onTap: (() => {showSuccessfulOrder(context)}),
                child: const GreenBottomButton(
                  title: 'Pay Now',
                ),
              ),
            ],
          ),
        ),
        height: sizer.hwt(317),
        width: sizer.w(375),
        decoration: BoxDecoration(
          color: designColorScheme.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
      ),
    );
  }
}
