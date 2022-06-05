import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/green_small_button.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(
          'https://firebasestorage.googleapis.com/v0/b/menubonus.appspot.com/o/Replace%20images4.png?alt=media&token=9c18bdee-5c4d-40ce-8d05-4ee61caa7a68',
          width: 88.w,
          height: 88.h,
        ),
        Text(
          'Mokaa Cokiees Vanilla',
          maxLines: 1,
          style: Theme.of(context).textTheme.headline6!.copyWith(
              fontSize: 18.sp,
              color: Theme.of(context).colorScheme.onSecondary),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\$ 15,45',
              maxLines: 2,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(
              'Total Prices',
              maxLines: 2,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 13.sp,
                  color: Theme.of(context)
                      .colorScheme
                      .onSecondary
                      .withOpacity(0.5)),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            GreenSmallButton(
              isSelected: false,
              title: 'Detail',
            ),
            GreenSmallButton(
              isSelected: true,
              title: 'Track Order',
            ),
          ],
        ),
      ],
    );
  }
}
