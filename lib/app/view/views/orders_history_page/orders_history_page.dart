import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:menu_loyalty/app/core/constants/enums.dart';
import 'package:menu_loyalty/app/view/widgets/label_widget.dart';
import 'package:menu_loyalty/app/view/widgets/leading_icon_app_bar.dart';
import 'package:menu_loyalty/app/view/widgets/title_app_bar.dart';
import 'components/completed_orders_list.dart';
import 'components/last_orders_list.dart';

class OrdersHistoryPage extends StatelessWidget {
  static const String routeName = 'OrdersHistoryPage';

  const OrdersHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
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
          leading: const LeadingIconAppBar(
            iconData: EvaIcons.arrowIosBackOutline,
          ),
          title: const TitleAppBar(
            title: 'Last Orders',
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
