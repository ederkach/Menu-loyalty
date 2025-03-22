import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:menu_loyalty/app/view/widgets/leading_icon_app_bar.dart';
import 'package:menu_loyalty/app/view/widgets/title_app_bar.dart';

import 'components/chats_list.dart';

class ChatsPage extends StatelessWidget {
  static const String routeName = 'ChatsPage';

  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizer = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const LeadingIconAppBar(
          iconData: EvaIcons.arrowIosBackOutline,
        ),
        title: const TitleAppBar(
          title: 'Chat',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: sizer.w(24),
        ),
        child: const ChatsList(),
      ),
    );
  }
}
