import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatsListItem extends StatelessWidget {
  const ChatsListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designStyleText = Theme.of(context).textTheme;
    var designColorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: 327.w,
      height: 74.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 32.r,
            backgroundImage: const NetworkImage(
                'https://t4.ftcdn.net/jpg/03/85/50/01/360_F_385500115_T8QiYsPeliQ5tE3npwOuJNUfunqFBo1U.jpg'), //AssetImage loads image URL.
          ),
          SizedBox(
            width: 16.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Orange Panglazed',
                    style:
                        designStyleText.bodyMedium!.copyWith(fontSize: 17.sp),
                  ),
                ],
              ),
              Text(
                'Romano cheese',
                style: designStyleText.bodyMedium!.copyWith(
                    fontSize: 13.sp,
                    color: designColorScheme.onSecondary.withOpacity(0.6)),
              ),
            ],
          ),
          SizedBox(
            width: 35.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '11:25 AM',
                style: designStyleText.bodyMedium!.copyWith(
                    fontSize: 13.sp,
                    color: designColorScheme.onSecondary.withOpacity(0.6)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
