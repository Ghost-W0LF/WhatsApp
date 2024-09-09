import 'package:flutter/material.dart';
import 'package:whats_app_ui/base/components/base_view_model/base_view.dart';

import 'package:whats_app_ui/base/navigation/navigation_service.dart';
import 'package:whats_app_ui/base/navigation/route_generator.dart';
import 'package:whats_app_ui/base/navigation/routes.dart';
import 'package:whats_app_ui/base/tokenstorage/toeken_storage.dart';
import 'package:whats_app_ui/views/detailed_chat/detailed_chat_viewmodel/detail_chat_view_model.dart';

import 'package:whats_app_ui/utils/theme/t_app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DetailChatViewModel()),
        ChangeNotifierProvider(create: (context) => BaseViewModel()),
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
  bool isLoading = true;

  final TokenStorage tokenStorage = TokenStorage();

  Future<void> _checkToken() async {
    String? savedToken = await tokenStorage.readToken();
    setState(() {
      isLogedin = savedToken != null;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading == true) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return MaterialApp(
      scaffoldMessengerKey: BaseViewModel.scaffoldKey,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: true,
      onGenerateRoute: RouteGenerator.generateRoutes,
      initialRoute: isLogedin ? Routes.homeView : Routes.loginView,
      navigatorKey: navigatorKey,
    );
  }
}
