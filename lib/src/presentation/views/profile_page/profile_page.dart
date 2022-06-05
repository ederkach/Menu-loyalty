import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'components/header_widget.dart';
import 'components/item_menu_profile.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = 'ProfilePage';

  const ProfilePage({Key? key}) : super(key: key);

  static Route route() {
    return PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        pageBuilder: (_, __, ___) => const ProfilePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: 17.sp),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  EvaIcons.settingsOutline,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              const HeaderWidget(),
              SizedBox(
                height: 30.h,
              ),
              Stack(
                children: [
                  const ItemMenuProfile(
                    evaIcons: EvaIcons.creditCardOutline,
                    onSubtitle: true,
                    title: 'Payment Method',
                    subTitle: 'Mastercard : 3424',
                    redColor: false,
                  ),
                  Positioned(
                    right: 10.w,
                    bottom: 33.h,
                    child: SizedBox(
                        width: 60.w,
                        height: 24.h,
                        child: Image.asset('assets/images/MasterCard.png')),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              const ItemMenuProfile(
                evaIcons: EvaIcons.pinOutline,
                onSubtitle: false,
                title: 'Save adress',
                subTitle: '',
                redColor: false,
              ),
              SizedBox(
                height: 15.h,
              ),
              const ItemMenuProfile(
                evaIcons: EvaIcons.bellOffOutline,
                onSubtitle: false,
                title: 'Notifications',
                subTitle: '',
                redColor: false,
              ),
              SizedBox(
                height: 15.h,
              ),
              Stack(children: [
                const ItemMenuProfile(
                  evaIcons: EvaIcons.syncOutline,
                  onSubtitle: false,
                  title: 'Order history',
                  subTitle: '',
                  redColor: false,
                ),
                Positioned(
                  right: 14.h,
                  bottom: 15.w,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'OrdersHistoryPage');
                    },
                    child: Container(
                        width: 59.w,
                        height: 59.h,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.all(
                            Radius.circular(16.r),
                          ),
                        ),
                        child: Icon(
                          EvaIcons.arrowIosForwardOutline,
                          color: Theme.of(context).colorScheme.background,
                        )),
                  ),
                ),
              ]),
              SizedBox(
                height: 15.h,
              ),
              const ItemMenuProfile(
                evaIcons: EvaIcons.logOutOutline,
                onSubtitle: false,
                title: 'Logout',
                subTitle: '',
                redColor: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
