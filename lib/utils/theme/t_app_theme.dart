import 'package:flutter/material.dart';
import 'package:whats_app_ui/utils/constants/t_colors.dart';
import 'package:whats_app_ui/utils/theme/text_theme.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Tcolors.darkGrey,
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    fontFamily: 'Roboto',
    
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color.fromARGB(255, 32, 32, 32),
    primaryColor: Tcolors.LightGrey,
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
  );
}
