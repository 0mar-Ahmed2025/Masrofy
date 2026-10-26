import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension WidgetExtension on Widget {
  Widget paddingAll(double value) {
    return Padding(padding: REdgeInsets.all(value), child: this);
  }

  Widget paddingHorizontal(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value),
      child: this,
    );
  }

  Widget center() => Center(child: this);

  Widget expanded() => Expanded(child: this);

  Widget flexible() => Flexible(child: this);

  Widget safeArea() => SafeArea(child: this);
}