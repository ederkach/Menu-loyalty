import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dot_widget.dart';

class IconButtonNabBar extends StatelessWidget {
  const IconButtonNabBar(
      {Key? key,
      required this.pageIndex,
      required this.evaIcons,
      required this.selectedIndex,
      required this.currentIndex})
      : super(key: key);

  final int pageIndex;
  final IconData evaIcons;
  final Function(int) selectedIndex;
  final int currentIndex;

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
        if (pageIndex == currentIndex)
          const DotWidget(
            green: true,
            withOpacity: 1,
          ),
      ],
    );
  }
}
