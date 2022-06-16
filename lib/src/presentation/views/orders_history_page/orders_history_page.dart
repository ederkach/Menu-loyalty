import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:menu_loyalty/src/config/size_config.dart';
import 'package:menu_loyalty/src/constants/enums.dart';
import 'package:menu_loyalty/src/presentation/widgets/label_widget.dart';

import 'components/completed_orders_list.dart';
import 'components/last_orders_list.dart';

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
            style: designStyleText.headlineMedium
                ?.copyWith(color: designColorScheme.onSecondary, fontSize: 17),
          ),
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: sizer.w(24),
        ),
        child: Column(
          children: [
            SizedBox(
              height: sizer.hwt(20),
            ),
            const LastOrdersList(),
            SizedBox(
              height: sizer.hwt(20),
            ),
            const LabelWidget(
              darkWhite: DarkWhite.dark,
              label: 'Complete task',
            ),
            SizedBox(
              height: sizer.hwt(20),
            ),
            const CompletedOrdersList(),
          ],
        ),
      ),
    );
  }
}
