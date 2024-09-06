import 'package:flutter/material.dart';
import 'package:whats_app_ui/base/components/snackbar_service.dart';
import 'package:whats_app_ui/base/navigation/navigation_service.dart';
import 'package:whats_app_ui/base/navigation/route_generator.dart';

import 'package:whats_app_ui/views/detailed_chat/detailed_chat_viewmodel/detail_chat_provider.dart';
import 'package:whats_app_ui/views/home_view/model/user_data_viewmodel.dart';

import 'package:whats_app_ui/utils/theme/t_app_theme.dart';
import 'package:provider/provider.dart';
import 'package:whats_app_ui/views/login_view/view_model/login_viewmodel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DetailChatProvider()),
        ChangeNotifierProvider(create: (context) => UserdataViewModel()),
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
      scaffoldMessengerKey: SnackBarService.scaffoldKey,
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
