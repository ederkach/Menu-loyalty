import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:menu_loyalty/src/constants/enums.dart';
import 'package:menu_loyalty/src/presentation/widgets/label_widget.dart';

import 'components/badge_status_order.dart';
import 'components/order_detail.dart';

class OrdersHistoryPage extends StatelessWidget {
  static const String routeName = 'OrdersHistoryPage';

  const OrdersHistoryPage({Key? key}) : super(key: key);

  static Route route() {
    return PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        pageBuilder: (_, __, ___) => const OrdersHistoryPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0.h),
        child: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          leading: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                EvaIcons.arrowIosBackOutline,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                EvaIcons.searchOutline,
              ),
            ),
          ],
          title: Text(
            'last orders',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 17.sp),
          ),
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 20.h),
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
            ),
            SizedBox(
              height: 20.h,
            ),
            const LabelWidget(
              darkWhite: DarkWhite.dark,
              label: 'Complete task',
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                        color: Theme.of(context).colorScheme.onPrimary,
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 20.h),
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
                            color: Theme.of(context).colorScheme.onPrimary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.r),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
