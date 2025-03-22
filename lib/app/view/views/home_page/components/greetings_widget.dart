import 'package:flutter/material.dart';

import 'package:menu_loyalty/app/core/config/size_config.dart';
import 'package:menu_loyalty/l10n/l10n.dart';

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
          context.l10n.homeGreetingText('Katharina'),
          style: designStyleText.titleLarge?.copyWith(fontSize: 19),
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
