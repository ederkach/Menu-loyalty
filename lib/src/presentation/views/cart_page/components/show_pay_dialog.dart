import 'package:flutter/material.dart';
import 'package:menu_loyalty/src/config/size_config.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../constants/enums.dart';
import '../../../widgets/button_up_grey.dart';
import '../../../widgets/delivery_information.dart';
import '../../../widgets/green_bottom_button.dart';
import '../../../widgets/label_widget.dart';
import 'list_payments.dart';

Future<dynamic> showPayDialog(BuildContext context) {
  var designColorScheme = Theme.of(context).colorScheme;
  var designStyleText = Theme.of(context).textTheme;
  var sizer = MediaQuery.of(context);
  return showMaterialModalBottomSheet(
    context: context,
    enableDrag: false,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40.0),
    ),
    builder: (context) => Container(
      height: sizer.hwt(606),
      decoration: BoxDecoration(
        color: designColorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: sizer.hwt(24),
          horizontal: sizer.w(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const ButtonUpGrey()),
            SizedBox(
              height: sizer.hwt(10),
            ),
            const LabelWidget(
                label: 'Payment method', darkWhite: DarkWhite.dark),
            SizedBox(
              height: sizer.hwt(190),
              child: const ListPayments(),
            ),
            SizedBox(
              height: sizer.hwt(20),
            ),
            const LabelWidget(
                label: 'Delivery information', darkWhite: DarkWhite.dark),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: sizer.hwt(20),
              ),
              child: const DeliveryInformation(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Estimated Arrived',
                  style: designStyleText.bodyMedium?.copyWith(
                      color: designColorScheme.onSecondary.withOpacity(0.5),
                      fontSize: 15),
                ),
                const Text('15-20 MIN')
              ],
            ),
            SizedBox(
              height: sizer.hwt(20),
            ),
            GestureDetector(
              onTap: (() => {Navigator.pushNamed(context, 'CheckOutPage')}),
              child: const GreenBottomButton(
                title: 'Place Order',
              ),
            )
          ],
        ),
      ),
    ),
  );
}
