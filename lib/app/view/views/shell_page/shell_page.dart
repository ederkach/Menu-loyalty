import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class ShellScreen extends StatelessWidget {
  const ShellScreen({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ShellScreen'));
  final StatefulNavigationShell navigationShell;

  bool isSelected(int index) {
    return index == navigationShell.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
    );
  }
}
