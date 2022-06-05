import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/enums.dart';
import 'badge_status_order.dart';
import 'order_detail.dart';

class LastOrdersList extends StatelessWidget {
  const LastOrdersList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 264.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          separatorBuilder: (BuildContext context, int index) =>
              VerticalDivider(
                color: Theme.of(context).colorScheme.onPrimary,
                width: 17.w,
              ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (() {}),
              child: Container(
                height: 264.h,
                width: 327.w,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                  child: Stack(
                    children: const [
                      BadgeStatusOrder(
                        statusOrder: StatusOrder.onGoing,
                      ),
                      OrderDetail(),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.r),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
