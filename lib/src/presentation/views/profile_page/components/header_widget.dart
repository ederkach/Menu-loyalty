import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return Row(
      children: [
        SizedBox(
          height: sizer.w(94),
          width: sizer.w(94),
          child: const ClipRRect(
            child: Image(
              image: NetworkImage(
                  'https://t4.ftcdn.net/jpg/03/85/50/01/360_F_385500115_T8QiYsPeliQ5tE3npwOuJNUfunqFBo1U.jpg'),
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        SizedBox(
          width: sizer.w(24),
        ),
        SizedBox(
          height: sizer.hwt(60),
          width: sizer.w(177),
          child: Text(
            'Hello,\nKatharina Kiddy 👋',
            maxLines: 2,
            style: designStyleText.bodyMedium
                ?.copyWith(color: designColorScheme.onSecondary, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
