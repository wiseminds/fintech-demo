import 'package:flutter/material.dart';

extension DoubleExt on double { 

  /// a spacer widget
  Spacer get s => const Spacer();

  /// convert a double field to SizedBox with its height
  SizedBox get h => SizedBox(height: this);

  /// convert a double field to SizedBox with its widget
  SizedBox get w => SizedBox(width: this);

  /// convert a double field to border radius with radius of its value
  BorderRadius get toBorderRadius => BorderRadius.circular(this);
}

extension IntExt on int {
  /// returns date in milliseconds as current Time + (this represented as seconds)
  int get secondsToMilliseconds =>
      DateTime.now().add(Duration(seconds: this)).millisecondsSinceEpoch;

  /// compares time in milliseconds against current timestamp
  /// and returns true if time is past
  bool get isPast => DateTime.now().millisecondsSinceEpoch > this;
  // double get height => ScreenUtil().setHeight(this);

  /// returns value as duration in seconds
  Duration get inMilliseconds => Duration(milliseconds: this); 

  double get stepToMeters => (this / 1312.33595801) * 1000;
}
