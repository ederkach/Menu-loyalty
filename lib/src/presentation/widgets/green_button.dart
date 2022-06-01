import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class GreenButton extends StatelessWidget {
  const GreenButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: 327.w,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.all(
          Radius.circular(28.r),
        ),
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Pay Now',
          style: Theme.of(context).textTheme.headline6!.copyWith(
              fontSize: 17.sp, color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
    );
  }
}
