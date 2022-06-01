import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import '../../../constants/enums.dart';
import '../../widgets/bottom_panel.dart';
import '../../widgets/button_up_dark.dart';
import '../../widgets/label_widget.dart';
import 'components/cart_list.dart';
import 'components/cart_sum.dart';

class CartPage extends StatelessWidget {
  static const String routeName = 'CartPage';

  const CartPage({Key? key}) : super(key: key);

  static Route route() {
    return PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        pageBuilder: (_, __, ___) => const CartPage());
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bottomPanelListWidgets = [
      const ButtonUpDark(),
      const CartSum()
    ];
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
          'Cart',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: 17.sp),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: const LabelWidget(
                label: 'Item to order',
                darkWhite: DarkWhite.dark,
              ),
            ),
            SizedBox(height: 20.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 375.w, height: 350.h, child: const CartList()),
              ],
            ),
            BottomPanel(
                width: 375.w,
                height: 335.h,
                bottomPanelListWidgets: bottomPanelListWidgets)
          ],
        ),
      ),
    );
  }
}
