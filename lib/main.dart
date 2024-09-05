import 'package:flutter/material.dart';
import 'package:whats_app_ui/base/navigation/navigation_service.dart';
import 'package:whats_app_ui/base/navigation/route_generator.dart';

import 'package:whats_app_ui/views/detailed_chat/detailed_chat_viewmodel/detail_chat_provider.dart';
import 'package:whats_app_ui/views/home_view/model/user_data_provider.dart.dart';

import 'package:whats_app_ui/utils/theme/t_app_theme.dart';
import 'package:provider/provider.dart';
import 'package:whats_app_ui/views/login_view/view_model/login_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DetailChatProvider()),
        ChangeNotifierProvider(create: (context) => UserDataProvider()),
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
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
      debugShowCheckedModeBanner: true,
      onGenerateRoute: RouteGenerator.generateRoutes,
      initialRoute: '/loginView',
      navigatorKey: navigatorKey,
    );
  }
}
