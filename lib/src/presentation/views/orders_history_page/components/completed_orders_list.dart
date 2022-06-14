import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/enums.dart';
import 'badge_status_order.dart';
import 'order_detail.dart';

class CompletedOrdersList extends StatelessWidget {
  const CompletedOrdersList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    return Expanded(
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          separatorBuilder: (BuildContext context, int index) => Divider(
                color: designColorScheme.onPrimary,
                height: 17.h,
              ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (() {}),
              child: SizedBox(
                height: 264,
                child: Container(
                  height: 264.h,
                  width: 327.w,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                    child: Stack(
                      children: const [
                        BadgeStatusOrder(
                          statusOrder: StatusOrder.complete,
                        ),
                        OrderDetail(),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: designColorScheme.onPrimary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.r),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
