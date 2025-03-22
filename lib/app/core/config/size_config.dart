import 'package:flutter/material.dart';

extension SizeConfig on MediaQueryData {
  /// 812 is the layout height that designer use
  static const double layoutHeight = 812.0;

  /// 375 is the layout width that designer use
  static const double layoutWidth = 375.0;

  /// Get the proportionate height as per screen size.
  double h(double inputHeight) => (inputHeight / layoutHeight) * size.height;

  /// Get the proportionate height as per screen size without top paddinng.
  double hwt(double inputHeight) =>
      (inputHeight / layoutHeight) * (size.height - viewPadding.top);

  /// Get the proportionate height as per screen size without top paddinng & bottom padding.
  double hwtb(double inputHeight) =>
      (inputHeight / layoutHeight) *
      (size.height - viewPadding.top - viewPadding.bottom);

  /// Get the proportionate height as per screen size.
  double w(double inputWidth) => (inputWidth / layoutWidth) * size.width;
}
