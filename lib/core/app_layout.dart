import 'package:flutter/widgets.dart';
import 'package:livescore/main.dart';

class AppLayout {
  static BuildContext? get context => appLayoutKey.currentContext;

  static Size getSize() {
    final currentContext = context;
    return currentContext != null
        ? MediaQuery.of(currentContext).size
        : Size.zero; // or any other default value you want to return
  }

  static double getScreenHeight() {
    final currentContext = context;
    return currentContext != null
        ? MediaQuery.of(currentContext).size.height
        : 0.0; // or any other default value you want to return
  }

  static double getScreenWidth() {
    final currentContext = context;
    return currentContext != null
        ? MediaQuery.of(currentContext).size.width
        : 0.0;
  }

  static double getHeight(double pixels) {
    final screenHeight = getScreenHeight();
    final minHeight = pixels;

    if (screenHeight != 0 && pixels != 0) {
      double x = screenHeight / pixels;
      return screenHeight / x;
    } else {
      return minHeight;
    }
  }

  static double getWidth(double pixels) {
    final screenHeight = getScreenWidth();
    final minHeight = pixels;

    if (screenHeight != 0 && pixels != 0) {
      double x = screenHeight / pixels;
      return screenHeight / x;
    } else {
      return minHeight;
    }
  }
}


// import 'package:flutter/widgets.dart';
// import 'package:livescore/main.dart';

// class AppLayout {
//   static BuildContext? get context => appLayoutKey.currentContext;

//   static Size getSize() {
//     return MediaQuery.of(context ?? appLayoutKey.currentContext!).size;
//   }

//   static double getScreenHeight() {
//     return MediaQuery.of(context ?? context!).size.height;
//   }

//   static double getScreenWidth() {
//     return MediaQuery.of(context ?? context!).size.width;
//   }

//   static double getHeight(double pixels) {
//     double x = getScreenHeight() / pixels;
//     return getScreenHeight() / x;
//   }

//   static double getWidth(double pixels) {
//     double x = getScreenWidth() / pixels;
//     return getScreenWidth() / x;
//   }
// }
