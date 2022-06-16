import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';
import 'package:menu_loyalty/src/presentation/widgets/dot_widget.dart';

class TypePaymentButton extends StatelessWidget {
  const TypePaymentButton({
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    var textColorTitle = (isSelected == true)
        ? designColorScheme.onPrimary
        : designColorScheme.onSecondary;
    var textColorSubtitle = (isSelected == true)
        ? designColorScheme.onPrimary
        : designColorScheme.onSecondary.withOpacity(0.5);

    return Container(
      height: sizer.hwt(80),
      width: sizer.w(155),
      padding: EdgeInsets.symmetric(
        vertical: sizer.w(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: sizer.w(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: sizer.hwt(24),
                  width: sizer.w(40),
                  child: Image.asset('assets/images/MasterCard.png'),
                ),
                SizedBox(
                  width: sizer.w(20),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Credit Card',
                      style: (isSelected == true)
                          ? designStyleText.bodyMedium
                              ?.copyWith(color: textColorTitle, fontSize: 15)
                          : designStyleText.bodyMedium
                              ?.copyWith(color: textColorTitle, fontSize: 15),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: sizer.w(5),
                          ),
                          child: DotWidget(
                              dotColor: textColorSubtitle,
                              sizeheight: 5,
                              sizewidth: 5),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: sizer.w(5),
                          ),
                          child: DotWidget(
                              dotColor: textColorSubtitle,
                              sizeheight: 5,
                              sizewidth: 5),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: sizer.w(5),
                          ),
                          child: DotWidget(
                              dotColor: textColorSubtitle,
                              sizeheight: 5,
                              sizewidth: 5),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: sizer.w(5),
                          ),
                          child: DotWidget(
                              dotColor: textColorSubtitle,
                              sizeheight: 5,
                              sizewidth: 5),
                        ),
                        Text(
                          '4356',
                          style: (isSelected == true)
                              ? designStyleText.bodyMedium?.copyWith(
                                  color: textColorSubtitle, fontSize: 15)
                              : designStyleText.bodyMedium?.copyWith(
                                  color: textColorSubtitle.withOpacity(0.5),
                                  fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              EvaIcons.checkmarkCircle2,
              color: (isSelected == true)
                  ? designColorScheme.onSecondary
                  : designColorScheme.secondaryContainer,
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: (isSelected == true)
            ? designColorScheme.primary
            : designColorScheme.secondaryContainer,
        borderRadius: const BorderRadius.all(Radius.circular(32)),
        boxShadow: isSelected == true
            ? const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0),
                )
              ]
            : null,
      ),
    );
  }
}
