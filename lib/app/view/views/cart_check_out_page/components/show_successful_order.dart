import 'package:flutter/material.dart';
import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:menu_loyalty/app/view/app_router/mobile/app_router.dart';
import 'package:menu_loyalty/app/view/widgets/green_bottom_button.dart';

Future<dynamic> showSuccessfulOrder(BuildContext context) {
  var designColorScheme = Theme.of(context).colorScheme;
  var designStyleText = Theme.of(context).textTheme;
  var sizer = MediaQuery.of(context);
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      insetPadding: EdgeInsets.all(
        sizer.w(20),
      ),
      buttonPadding: EdgeInsets.all(
        sizer.w(20),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      content: Padding(
        padding: EdgeInsets.all(
          sizer.w(30),
        ),
        child: Container(
          height: sizer.hwt(175),
          width: sizer.w(327),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/images/Checkmark.png',
                  height: sizer.hwt(74),
                  width: sizer.w(74),
                ),
                SizedBox(
                  height: sizer.hwt(10),
                ),
                Text(
                  "Your Ordered Successfully",
                  style: designStyleText.headlineMedium?.copyWith(
                      color: designColorScheme.onSecondary, fontSize: 17),
                ),
                SizedBox(
                  height: sizer.hwt(10),
                ),
                Text(
                  "Your successfully place an order. Your order confirm and delivered within 20 minutes.Wish you enjoy the meal.",
                  textAlign: TextAlign.center,
                  style: designStyleText.headlineMedium?.copyWith(
                      color:
                          designColorScheme.onSecondary.withValues(alpha: 0.5),
                      fontSize: 12),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: designColorScheme.onPrimary,
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
          ),
        ),
      ),
      actions: <Widget>[
        GestureDetector(
          onTap: () => {
            HomeRoute().pushReplacement(context),
          },
          child: const GreenBottomButton(
            title: 'Keep Browsing',
          ),
        ),
      ],
    ),
  );
}
