import 'package:flutter/material.dart';

import 'package:menu_loyalty/app/core/config/size_config.dart';

class ChatsListItem extends StatelessWidget {
  const ChatsListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designStyleText = Theme.of(context).textTheme;
    var designColorScheme = Theme.of(context).colorScheme;
    var sizer = MediaQuery.of(context);
    return SizedBox(
      height: sizer.hwt(74),
      width: sizer.w(327),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(
                'https://t4.ftcdn.net/jpg/03/85/50/01/360_F_385500115_T8QiYsPeliQ5tE3npwOuJNUfunqFBo1U.jpg'), //AssetImage loads image URL.
          ),
          SizedBox(
            width: sizer.w(16),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Orange Panglazed',
                    style: designStyleText.bodyMedium!.copyWith(fontSize: 17),
                  ),
                ],
              ),
              Text(
                'Romano cheese',
                style: designStyleText.bodyMedium!.copyWith(
                    fontSize: 13,
                    color:
                        designColorScheme.onSecondary.withValues(alpha: 0.6)),
              ),
            ],
          ),
          SizedBox(
            width: sizer.w(35),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '11:25 AM',
                style: designStyleText.bodyMedium!.copyWith(
                    fontSize: 13,
                    color:
                        designColorScheme.onSecondary.withValues(alpha: 0.6)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
