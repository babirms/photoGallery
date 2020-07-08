import 'package:flutter/widgets.dart';

class Dimensions {
  static double getConvertedHeightSize(
      double sizeInPixel, BuildContext context) {
    double baseScreenHeight = 592;
    MediaQueryData queryData = MediaQuery.of(context);
    double currentScreenHeight = queryData.size.height;

    if (sizeInPixel == null) sizeInPixel = 0.0;
    return (sizeInPixel * (currentScreenHeight)) / baseScreenHeight;
  }

  static double getConvertedWidthSize(
      double sizeInPixel, BuildContext context) {
    double baseScreenWidth = 360;
    MediaQueryData queryData = MediaQuery.of(context);
    double currentScreenWidth = queryData.size.width;

    if (sizeInPixel == null) sizeInPixel = 0.0;
    return (sizeInPixel * (currentScreenWidth)) / baseScreenWidth;
  }

  static EdgeInsets getEdgeInsets(BuildContext context,
      {double top, double bottom, double left, double right}) {
    return EdgeInsets.only(
        top: getConvertedHeightSize(top, context),
        bottom: getConvertedHeightSize(bottom, context),
        left: getConvertedWidthSize(left, context),
        right: getConvertedWidthSize(right, context));
  }

  static EdgeInsets getEdgeInsetsAll(BuildContext context, double size) {
    return EdgeInsets.only(
        top: getConvertedHeightSize(size, context),
        bottom: getConvertedHeightSize(size, context),
        left: getConvertedWidthSize(size, context),
        right: getConvertedWidthSize(size, context));
  }

  static EdgeInsets getEdgeInsetsFromLTRB(BuildContext context, double left,
      double top, double right, double bottom) {
    return EdgeInsets.fromLTRB(
        getConvertedWidthSize(left, context),
        getConvertedHeightSize(top, context),
        getConvertedWidthSize(right, context),
        getConvertedHeightSize(bottom, context));
  }

  static EdgeInsets getEdgeInsetsSymmetric(
      BuildContext context, double horizontal, double vertical) {
    return EdgeInsets.fromLTRB(
        getConvertedWidthSize(horizontal, context),
        getConvertedHeightSize(vertical, context),
        getConvertedWidthSize(horizontal, context),
        getConvertedHeightSize(vertical, context));
  }

  static double getTextSize(context, double sizeInPixel) {
    return getConvertedHeightSize(sizeInPixel, context);
  }
}
