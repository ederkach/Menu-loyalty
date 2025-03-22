import 'package:flutter/material.dart';

import 'package:menu_loyalty/app/core/config/size_config.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    required this.description,
    Key? key,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var sizer = MediaQuery.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Descriptions',
          maxLines: 1,
          style: designStyleText.displayMedium!
              .copyWith(fontSize: 20, color: designColorScheme.onSecondary),
        ),
        SizedBox(
          height: sizer.hwt(15),
        ),
        Text(
          description,
          maxLines: 3,
          style: designStyleText.displayMedium!.copyWith(
              fontSize: 15,
              color: designColorScheme.onSecondary.withValues(alpha: 0.6)),
        ),
      ],
    );
  }
}
