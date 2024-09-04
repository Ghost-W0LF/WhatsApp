import 'package:flutter/material.dart';
import 'package:whats_app_ui/utils/constants/t_colors.dart';

import 'package:whats_app_ui/views/contact/view/contact.dart';

import 'package:whats_app_ui/views/home_view/widget/chat_listview.dart';
import 'package:whats_app_ui/utils/constants/t_text.dart';
import 'package:whats_app_ui/views/login_view/services/toeken_storage.dart';
import 'package:whats_app_ui/views/login_view/view/login_view.dart';

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
          appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,

            automaticallyImplyLeading: false,
            title: const Text(Ttext.homepageTitlte),
            actions: [
              IconButton(
                  onPressed: () {
                 
                  },
                  icon:
                      /*  tkn == null ?const Icon(Icons.search) : */ const Icon(
                          Icons.search)),
              IconButton(
                  onPressed: () {
                    tokenStorage.deletToken('token');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  LoginView()),
                    );
                  },
                  icon: const Icon(Icons.logout))
            ],
            //
            //Tabs
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.group),
              ),
              Tab(text: Ttext.chats),
              Tab(text: Ttext.call),
              Tab(text: Ttext.status),
            ]),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_bike),
              ChatListView(),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bike),
            ],
          ),
          //
          //Floating action buttom
          floatingActionButton: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Tcolors.whatsAppGreen,
                borderRadius: BorderRadius.circular(50)),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactView()),
                );
              },
              icon: const Icon(Icons.message_rounded),
              color: Colors.white,
            ),
          ),
        ));
  }
}
