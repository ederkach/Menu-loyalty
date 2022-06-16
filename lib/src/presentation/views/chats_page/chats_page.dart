import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:menu_loyalty/src/config/size_config.dart';

import 'components/chats_list.dart';

class ChatsPage extends StatelessWidget {
  static const String routeName = 'ChatsPage';

  const ChatsPage({Key? key}) : super(key: key);

  static Route route() {
    return PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        pageBuilder: (_, __, ___) => const ChatsPage());
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
          'Chat',
          style: designStyleText.headlineMedium
              ?.copyWith(color: designColorScheme.onSecondary, fontSize: 17),
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
