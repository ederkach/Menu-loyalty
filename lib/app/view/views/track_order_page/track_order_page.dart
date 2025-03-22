import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:menu_loyalty/app/view/widgets/leading_icon_app_bar.dart';
import 'package:menu_loyalty/app/view/widgets/title_app_bar.dart';

class TrackOrderPage extends StatelessWidget {
  static const String routeName = 'TrackOrderPage';

  const TrackOrderPage({Key? key}) : super(key: key);

  static Route route() {
    return PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        pageBuilder: (_, __, ___) => const TrackOrderPage());
  }

  @override
  Widget build(BuildContext context) {
    var sizer = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const LeadingIconAppBar(
          iconData: EvaIcons.arrowIosBackOutline,
        ),
        title: const TitleAppBar(
          title: 'Track Order',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: sizer.w(24),
        ),
        child: Container(),
      ),
    );
  }
}
