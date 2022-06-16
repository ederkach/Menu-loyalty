import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';

import '../../../../constants/enums.dart';
import 'badge_status_order.dart';
import 'order_detail.dart';

class LastOrdersList extends StatelessWidget {
  const LastOrdersList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var sizer = MediaQuery.of(context);
    return SizedBox(
      height: sizer.hwt(264),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          separatorBuilder: (BuildContext context, int index) =>
              VerticalDivider(
                color: designColorScheme.onPrimary,
                width: sizer.w(17),
              ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (() {}),
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
                        statusOrder: StatusOrder.onGoing,
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
            );
          }),
    );
  }
}
