import 'package:flutter/material.dart';
import 'package:whats_app_ui/views/detailed_chat/model/detail_chat_provider.dart';
import 'package:whats_app_ui/views/home_view/model/user_data_provider.dart.dart';
import 'package:whats_app_ui/base/tokenstorage/toeken_storage.dart';
import 'package:whats_app_ui/views/home_view/view/home_view.dart';
import 'package:whats_app_ui/views/login_view/view/login_view.dart';
import 'package:whats_app_ui/utils/theme/t_app_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DetailChatProvider()),
        ChangeNotifierProvider(create: (context) => UserDataProvider()),
        ChangeNotifierProvider(create: (context) => TokenStorage()),
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
  final  savedToken= context.read<TokenStorage>().readToken;
  if(savedToken.toString().isEmpty){}
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home:savedToken.toString().isEmpty? LoginView():const HomeView(),
    );
  }
}
