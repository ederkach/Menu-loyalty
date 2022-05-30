import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({
    required this.withOpacity,
    required this.green,
    Key? key,
  }) : super(key: key);

  final double withOpacity;
  final bool green;

  @override
  Widget build(BuildContext context) {
    Color _colorTemp;

    if (!green) {
      _colorTemp =
          Theme.of(context).colorScheme.onSecondary.withOpacity(withOpacity);
    } else {
      _colorTemp =
          Theme.of(context).colorScheme.secondary.withOpacity(withOpacity);
    }

    return Container(
      height: 7.h,
      width: 7.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _colorTemp,
      ),
    );
  }
}
