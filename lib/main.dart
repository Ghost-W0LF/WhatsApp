import 'package:flutter/material.dart';
import 'package:whats_app_ui/screens/login_page.dart';
import 'package:whats_app_ui/utils/theme/t_app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
    theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const Loginpage(),
    );
  }
}
