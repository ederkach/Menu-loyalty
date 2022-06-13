import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

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
          'Chat',
          style: designStyleText.headlineMedium
              ?.copyWith(color: designColorScheme.onSecondary, fontSize: 17.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: const ChatsList(),
      ),
    );
  }
}
