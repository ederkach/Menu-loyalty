import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:menu_loyalty/src/config/size_config.dart';

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
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: designColorScheme.secondaryContainer,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          sizer.hwt(70),
        ),
        child: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
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
            'Confirm Order',
            style: designStyleText.headlineMedium
                ?.copyWith(color: designColorScheme.onSecondary, fontSize: 17),
          ),
          centerTitle: true,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: sizer.w(24),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: sizer.hwt(20),
                ),
                const DeliveredTo(),
                SizedBox(
                  height: sizer.hwt(20),
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(
                        sizer.w(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Items Order',
                              style: designStyleText.headline6!
                                  .copyWith(fontSize: 16)),
                          SizedBox(
                            height: sizer.hwt(10),
                          ),
                          const CheckOutList(),
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
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: BottomPanel(
              height: sizer.hwt(317),
              width: sizer.w(375),
              bottomButtonWidgets: const ButtonUpDark(),
              supportWidgets: const ChoosePayment(),
              bottomPanelListWidgets: GestureDetector(
                onTap: (() => {showBottomPayPanel(context)}),
                child: const GreenButton(
                  title: 'Pay Now',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> showBottomPayPanel(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        insetPadding: EdgeInsets.all(
          sizer.w(20),
        ),
        buttonPadding: EdgeInsets.all(
          sizer.w(20),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        content: Padding(
          padding: EdgeInsets.all(
            sizer.w(30),
          ),
          child: Container(
            height: sizer.hwt(175),
            width: sizer.w(327),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/images/Checkmark.png',
                    height: sizer.hwt(74),
                    width: sizer.w(74),
                  ),
                  SizedBox(
                    height: sizer.hwt(10),
                  ),
                  Text(
                    "Your Ordered Successfully",
                    style: designStyleText.headlineMedium?.copyWith(
                        color: designColorScheme.onSecondary, fontSize: 17),
                  ),
                  SizedBox(
                    height: sizer.hwt(10),
                  ),
                  Text(
                    "Your successfully place an order. Your order confirm and delivered within 20 minutes.Wish you enjoy the meal.",
                    textAlign: TextAlign.center,
                    style: designStyleText.headlineMedium?.copyWith(
                        color: designColorScheme.onSecondary.withOpacity(0.5),
                        fontSize: 12),
                  ),
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
