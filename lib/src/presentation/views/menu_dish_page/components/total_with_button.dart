import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menu_loyalty/src/config/size_config.dart';

class TotalWithButtonWidget extends StatelessWidget {
  const TotalWithButtonWidget({
    Key? key,
    required this.designStyleText,
    required this.designColorScheme,
  }) : super(key: key);

  final TextTheme designStyleText;
  final ColorScheme designColorScheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Prices',
                maxLines: 2,
                style: designStyleText.headline6!.copyWith(
                    fontSize: 17.sp, color: designColorScheme.onSecondary),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                '\$ 15,45',
                maxLines: 2,
                style: designStyleText.headline6!.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: designColorScheme.secondary),
              ),
            ],
          ),
          SizedBox(
            width: 50.w,
          ),
          Text(
            'Add to Cart',
            style: designStyleText.headline6!.copyWith(
                fontSize: 17.sp, color: designColorScheme.onSecondary),
          ),
          SizedBox(
            width: 10.w,
          ),
          Container(
            height: MediaQuery.of(context).getProportionateScreenWidth(72),
            width: MediaQuery.of(context).getProportionateScreenWidth(72),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                EvaIcons.shoppingBagOutline,
                color: designColorScheme.onPrimary,
              ),
            ),
            decoration: BoxDecoration(
              color: designColorScheme.primary,
              borderRadius: BorderRadius.all(
                Radius.circular(26.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
