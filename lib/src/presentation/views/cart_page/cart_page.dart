import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:menu_loyalty/src/config/size_config.dart';
import 'package:menu_loyalty/src/presentation/widgets/button_up_grey.dart';
import 'package:menu_loyalty/src/presentation/widgets/delivery_information.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../constants/enums.dart';
import '../../widgets/bottom_panel.dart';
import '../../widgets/button_up_dark.dart';
import '../../widgets/green_bottom_button.dart';
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
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    showMaterialModalBottomSheet(
      context: context,
      enableDrag: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      builder: (context) => Container(
        height: sizer.hwt(606),
        decoration: BoxDecoration(
          color: designColorScheme.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: sizer.hwt(24),
            horizontal: sizer.w(24),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const ButtonUpGrey()),
              SizedBox(
                height: sizer.hwt(10),
              ),
              const LabelWidget(
                  label: 'Payment method', darkWhite: DarkWhite.dark),
              SizedBox(
                height: sizer.hwt(190),
                child: const ListPayments(),
              ),
              SizedBox(
                height: sizer.hwt(20),
              ),
              const LabelWidget(
                  label: 'Delivery information', darkWhite: DarkWhite.dark),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: sizer.hwt(20),
                ),
                child: const DeliveryInformation(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Estimated Arrived',
                    style: designStyleText.bodyMedium?.copyWith(
                        color: designColorScheme.onSecondary.withOpacity(0.5),
                        fontSize: 15),
                  ),
                  const Text('15-20 MIN')
                ],
              ),
              SizedBox(
                height: sizer.hwt(20),
              ),
              GestureDetector(
                onTap: (() => {Navigator.pushNamed(context, 'CheckOutPage')}),
                child: const GreenBottomButton(
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
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(
            left: sizer.w(10),
          ),
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
          style: designStyleText.headlineMedium
              ?.copyWith(color: designColorScheme.onSecondary, fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: sizer.hwt(10),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: sizer.w(24),
                ),
                child: const LabelWidget(
                  label: 'Item to order',
                  darkWhite: DarkWhite.dark,
                ),
              ),
              SizedBox(
                height: sizer.hwt(10),
              ),
              const Expanded(child: CartList()),
            ],
          ),
          Positioned(
            bottom: 0,
            child: BottomPanel(
              width: sizer.w(375),
              height: sizer.h(335),
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
