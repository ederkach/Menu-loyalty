import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import '../../widgets/bottom_panel.dart';
import '../../widgets/button_up_dark.dart';
import '../../widgets/green_button.dart';
import 'components/check_out_list.dart';
import 'components/choose_payment.dart';
import 'components/delivered_to.dart';

class CheckOutPage extends StatelessWidget {
  static const String routeName = 'CheckOutPage';

  const CheckOutPage({Key? key}) : super(key: key);

  static Route route() {
    return PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        pageBuilder: (_, __, ___) => const CheckOutPage());
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bottomPanelListWidgets = [
      const ButtonUpDark(),
      const ChoosePayment(),
      GestureDetector(
        onTap: (() => {
              showBottomPayPanel(context)
            }),
        child: const GreenButton(
          title: 'Pay Now',
        ),
      )
    ];
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
          title: Text(
            'Confirm Order',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 17.sp),
          ),
          centerTitle: true,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                const DeliveredTo(),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(20.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Items Order',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(fontSize: 16.sp)),
                          SizedBox(
                            height: 10.h,
                          ),
                          const CheckOutList(),
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
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: BottomPanel(
                width: 375.w,
                height: 317.h,
                bottomPanelListWidgets: bottomPanelListWidgets),
          )
        ],
      ),
    );
  }

  Future<dynamic> showBottomPayPanel(BuildContext context) {
    return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                insetPadding: EdgeInsets.all(20.w),
                buttonPadding: EdgeInsets.all(20.w),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0))),
                content: Padding(
                  padding: EdgeInsets.all(30.w),
                  child: Container(
                    height: 175.h,
                    width: 327.w,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'assets/images/Checkmark.png',
                            height: 74.w,
                            width: 74.w,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Your Ordered Successfully",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    fontSize: 17.sp),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Your successfully place an order. Your order confirm and delivered within 20 minutes.Wish you enjoy the meal.",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary
                                        .withOpacity(0.5),
                                    fontSize: 12.sp),
                          ),
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
                actions: <Widget>[
                  GestureDetector(
                    onTap: () => {
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'MainNavBar', (route) => false)
                    },
                    child: const GreenButton(
                      title: 'Keep Browsing',
                    ),
                  ),
                ],
              ),
            );
  }
}
