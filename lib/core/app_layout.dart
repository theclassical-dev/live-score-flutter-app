import 'package:flutter/widgets.dart';
import 'package:livescore/main.dart';

class AppLayout {
  static BuildContext? get context => appLayoutKey.currentContext;

  static Size getSize() {
    return MediaQuery.of(context!).size;
  }

  static double getScreenHeight() {
    return MediaQuery.of(context!).size.height;
  }

  static double getScreenWidth() {
    return MediaQuery.of(context!).size.width;
  }

  static double getHeight(double pixels) {
    double x = getScreenHeight() / pixels;
    return getScreenHeight() / x;
  }

  static double getWidth(double pixels) {
    double x = getScreenWidth() / pixels;
    return getScreenWidth() / x;
  }
}
