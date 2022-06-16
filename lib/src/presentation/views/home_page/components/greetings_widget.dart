import 'package:flutter/material.dart';

import 'package:menu_loyalty/src/config/size_config.dart';

class GreetingsWidget extends StatelessWidget {
  const GreetingsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi, Katharina 👋',
          style: designStyleText.headline6?.copyWith(fontSize: 19),
        ),
        SizedBox(
          height: sizer.hwt(10),
        ),
        Text(
          'Want to order delicious food?',
          style: designStyleText.titleMedium?.copyWith(fontSize: 15),
        ),
      ],
    );
  }
}
