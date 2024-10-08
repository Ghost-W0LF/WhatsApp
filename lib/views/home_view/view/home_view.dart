import 'package:flutter/material.dart';
import 'package:whats_app_ui/views/home_view/widget/user_list.dart';
import 'package:whats_app_ui/base/tokenstorage/toeken_storage.dart';
import 'package:whats_app_ui/views/home_view/widget/floating_action_button.dart';
import 'package:whats_app_ui/views/home_view/widget/home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final TokenStorage tokenStorage = TokenStorage();

    return DefaultTabController(
        length: 4,
        initialIndex: 1,
        child: Scaffold(
          //
          //Appbar
          appBar: HomeAppBar(tokenStorage: tokenStorage),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_bike),
              UserList(),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bike),
            ],
          ),
          //
          //Floating action buttom
          floatingActionButton: const FloatingButton(),
        ));
  }
}
