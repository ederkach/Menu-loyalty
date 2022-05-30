import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class GreetingsWidget extends StatelessWidget {
  const GreetingsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi, Heldan 👋',
          style:
              Theme.of(context).textTheme.headline6?.copyWith(fontSize: 19.sp),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          'Want to order delicious food?',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontSize: 15.sp),
        ),
      ],
    );
  }
}
