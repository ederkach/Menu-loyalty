import 'package:flutter/material.dart';

import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:menu_loyalty/app/core/constants/enums.dart';
import 'badge_status_order.dart';
import 'order_detail.dart';

class CompletedOrdersList extends StatelessWidget {
  const CompletedOrdersList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var sizer = MediaQuery.of(context);
    return Expanded(
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          separatorBuilder: (BuildContext context, int index) => Divider(
                color: designColorScheme.onPrimary,
                height: sizer.hwt(17),
              ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (() {}),
              child: SizedBox(
                height: sizer.hwt(264),
                child: Container(
                  height: sizer.hwt(264),
                  width: sizer.w(327),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: sizer.w(10),
                      vertical: sizer.hwt(20),
                    ),
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
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
