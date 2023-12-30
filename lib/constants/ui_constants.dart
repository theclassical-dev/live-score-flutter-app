import 'package:flutter/material.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: const Text('SCORELINE'),
      centerTitle: true,
    );
  }

  static List<Widget> bottomTabBarPages = [
    const Text('first screen'),
    const Text('second screen'),
    const Text('third screen'),
  ];
}
