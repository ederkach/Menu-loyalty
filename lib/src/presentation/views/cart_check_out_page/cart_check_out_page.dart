import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:menu_loyalty/src/config/size_config.dart';

import '../../widgets/custom_app_bar.dart';
import 'components/check_out_bottom_panel.dart';
import 'components/check_out_list.dart';
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
        child: const CustomAppBar(
          title: 'Confirm Order',
          iconLeading: EvaIcons.arrowIosBackOutline,
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
          CheckOutBottomPanel(
              sizer: sizer, designColorScheme: designColorScheme)
        ],
      ),
    );
  }
}
