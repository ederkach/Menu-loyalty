import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'chats_list_item.dart';

class ChatsList extends StatefulWidget {
  const ChatsList({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatsList> createState() => _ChatsListState();
}

class _ChatsListState extends State<ChatsList> {
  int _selectedIndex = 0;

  void selectIndex(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: designColorScheme.onSecondary.withOpacity(0.5),
        height: 20.w,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: (() {
            selectIndex(index);
          }),
          child: const ChatsListItem(),
        );
      },
    );
  }
}
