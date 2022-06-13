import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:menu_loyalty/src/presentation/widgets/button_up_grey.dart';
import 'package:menu_loyalty/src/presentation/widgets/delivery_information.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../constants/enums.dart';
import '../../widgets/bottom_panel.dart';
import '../../widgets/button_up_dark.dart';
import '../../widgets/green_button.dart';
import '../../widgets/label_widget.dart';
import 'components/cart_list.dart';
import 'components/cart_sum.dart';
import 'components/list_payments.dart';

class CartPage extends StatefulWidget {
  static const String routeName = 'CartPage';

  const CartPage({Key? key}) : super(key: key);

  static Route route() {
    return PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        pageBuilder: (_, __, ___) => const CartPage());
  }

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
  }

  void payNow() {
    showMaterialModalBottomSheet(
      context: context,
      enableDrag: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      builder: (context) => Container(
        height: 606.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.r),
            topRight: Radius.circular(40.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const ButtonUpGrey()),
              SizedBox(
                height: 10.h,
              ),
              const LabelWidget(
                  label: 'Payment method', darkWhite: DarkWhite.dark),
              SizedBox(
                height: 190.h,
                child: const ListPayments(),
              ),
              SizedBox(
                height: 20.h,
              ),
              const LabelWidget(
                  label: 'Delivery information', darkWhite: DarkWhite.dark),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: const DeliveryInformation(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Estimated Arrived',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondary
                            .withOpacity(0.5),
                        fontSize: 15.sp),
                  ),
                  const Text('15-20 MIN')
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: (() => {Navigator.pushNamed(context, 'CheckOutPage')}),
                child: const GreenButton(
                  title: 'Place Order',
                ),
              )
            ],
          ),
        ),
      ),
    );
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
          'Cart',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: 17.sp),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
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
              SizedBox(height: 10.h),
              const Expanded(child: CartList()),
            ],
          ),
          Positioned(
            bottom: 0,
            child: BottomPanel(
              width: 375.w,
              height: 335.h,
              bottomButtonWidgets: const ButtonUpDark(),
              supportWidgets: const SizedBox(),
              bottomPanelListWidgets: CartSum(
                payNow: payNow,
              ),
            ),
          )
        ],
      ),
    );
  }
}
