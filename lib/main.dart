import 'package:flutter/material.dart';
import 'package:whats_app_ui/base/components/snackbar_service.dart';
import 'package:whats_app_ui/base/navigation/navigation_service.dart';
import 'package:whats_app_ui/base/navigation/route_generator.dart';
import 'package:whats_app_ui/base/tokenstorage/toeken_storage.dart';

import 'package:whats_app_ui/views/detailed_chat/detailed_chat_viewmodel/detail_chat_provider.dart';
import 'package:whats_app_ui/views/home_view/home_view_model/user_data_viewmodel.dart';

import 'package:whats_app_ui/utils/theme/t_app_theme.dart';
import 'package:provider/provider.dart';
import 'package:whats_app_ui/views/login_view/view_model/login_viewmodel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DetailChatProvider()),
        ChangeNotifierProvider(create: (context) => UserDataViewModel()),
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool isLogedin = false;

  final TokenStorage tokenStorage = TokenStorage();

  Future<void> _checkToken() async {
    String? savedToken = await tokenStorage.readToken();
    setState(() {
      isLogedin = savedToken != null;
    });
  }

  @override
  void initState() {
    super.initState();
    _checkToken();
  }

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
      initialRoute: isLogedin ? '/homeView' : '/loginView',
      navigatorKey: navigatorKey,
    );
  }
}
