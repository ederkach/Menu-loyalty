import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/dot_widget.dart';

class IconButtonNabBar extends StatelessWidget {
  const IconButtonNabBar({
    Key? key,
    required this.pageIndex,
    required this.evaIcons,
    required this.selectedIndex,
    required this.currentIndex,
    required this.showDot,
  }) : super(key: key);

  final int pageIndex;
  final IconData evaIcons;
  final Function(int) selectedIndex;
  final int currentIndex;
  final bool showDot;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            selectedIndex(currentIndex);
          },
          icon: Icon(
            evaIcons,
            size: 24.sp,
          ),
        ),
        if (showDot)
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: DotWidget(
              dotColor: Theme.of(context).colorScheme.secondary,
              sizeheight: 7,
              sizewidth: 7,
            ),
          ),
      ],
    );
  }
}