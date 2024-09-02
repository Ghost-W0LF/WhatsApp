import 'package:flutter/material.dart';
import 'package:whats_app_ui/features/detailed_chat/model/detail_chat_model.dart';
import 'package:whats_app_ui/features/login_view/view/login_view.dart';
import 'package:whats_app_ui/utils/theme/t_app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DetailChatModel()),
      ],
      child: const MyApp(),
    ),
  );
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
      home: const LoginView(),
    );
  }
}
