import 'dart:math';

import 'package:flutter/material.dart';

class Responsive {
  Responsive({
    this.designWidth = 387,
    this.designHeight = 688,
  });
  final double designWidth;
  final double designHeight;

  //BuildContext context;

  double w(num width) {
    return width *
        (MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width /
            designWidth);
  }

  double h(num height) {
    return height *
        (MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                .size
                .height /
            designHeight);
  }

  double fs(num size) {
    return min(
        size *
            (MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                    .size
                    .height /
                designHeight),
        size *
            (MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                    .size
                    .width /
                designWidth));
  }
}

extension SizeExtension on num {
  double get w => Responsive().w(this);
  double get h => Responsive().h(this);
  double get fs => Responsive().fs(this);
}
