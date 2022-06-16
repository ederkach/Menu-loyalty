import 'package:flutter/material.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;

    return Text(
      title,
      style: designStyleText.headlineMedium
          ?.copyWith(color: designColorScheme.onSecondary, fontSize: 17),
    );
  }
}
