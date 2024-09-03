import 'package:flutter/material.dart';
import 'package:whats_app_ui/views/detailed_chat/model/detail_chat_model.dart';
import 'package:whats_app_ui/views/home_view/model/user_data_provider.dart.dart';
import 'package:whats_app_ui/views/login_view/services/toeken_storage.dart';
import 'package:whats_app_ui/views/login_view/view/login_view.dart';
import 'package:whats_app_ui/utils/theme/t_app_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  TokenStorage tokenStorage = TokenStorage();
  String? savedToken = await tokenStorage.readToken();

  if (savedToken != null) {
    debugPrint("Saved Token is: $savedToken");
  } else {
    debugPrint("notoken Saved");
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DetailChatModel()),
        ChangeNotifierProvider(create: (context) => UserDataProvider()),
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
