import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';

import '../../../widgets/qty_button.dart';

class QtyWidget extends StatelessWidget {
  const QtyWidget({
    Key? key,
    required this.designStyleText,
    required this.designColorScheme,
  }) : super(key: key);

  final TextTheme designStyleText;
  final ColorScheme designColorScheme;

  @override
  Widget build(BuildContext context) {
    var sizer = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(
        top: sizer.hwt(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QtyButton(
                title: '+',
                background: designColorScheme.secondary,
              ),
              Text(
                '100.5',
                style: designStyleText.bodyMedium!.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: designColorScheme.onSecondary),
              ),
              QtyButton(
                title: '-',
                background: designColorScheme.secondaryContainer,
              ),
            ],
          ),
          Container(
            height: sizer.hwt(43),
            width: sizer.w(143),
            child: Center(
                child: Text(
              'Try promo code',
              maxLines: 1,
              textAlign: TextAlign.center,
              style: designStyleText.bodyMedium!
                  .copyWith(fontSize: 15, color: designColorScheme.onPrimary),
            )),
            decoration: const BoxDecoration(
              color: Color(0xFFFF9800),
              borderRadius: BorderRadius.all(
                Radius.circular(26),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
