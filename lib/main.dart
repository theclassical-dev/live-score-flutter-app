import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livescore/features/welcome/view/welcome.dart';
import 'package:livescore/theme/theme.dart';

GlobalKey<NavigatorState> appLayoutKey = GlobalKey<NavigatorState>();

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Pallete.backgroundColor,
      systemNavigationBarColor: Pallete.backgroundColor,
    ),
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LiverScore',
      theme: AppTheme.theme,
      home: const WelcomeScreen(),
    );
  }
}
