import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    return Row(
      children: [
        SizedBox(
          width: 94.w,
          height: 94.w,
          child: ClipRRect(
            child: const Image(
              image: NetworkImage(
                  'https://t4.ftcdn.net/jpg/03/85/50/01/360_F_385500115_T8QiYsPeliQ5tE3npwOuJNUfunqFBo1U.jpg'),
            ),
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
          ),
        ),
        SizedBox(
          width: 24.w,
        ),
        SizedBox(
          height: 60.h,
          width: 177.w,
          child: Text(
            'Hello,\nKatharina Kiddy 👋',
            maxLines: 2,
            style: designStyleText.bodyMedium?.copyWith(
                color: designColorScheme.onSecondary, fontSize: 20.sp),
          ),
        ),
      ],
    );
  }
}
