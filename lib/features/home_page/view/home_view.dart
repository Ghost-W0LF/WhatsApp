import 'package:flutter/material.dart';
import 'package:whats_app_ui/utils/constants/t_colors.dart';

import 'package:whats_app_ui/features/contact/view/contact.dart';

import 'package:whats_app_ui/features/home_page/widget/chat_listview.dart';
import 'package:whats_app_ui/utils/constants/t_text.dart';
import 'package:whats_app_ui/utils/helpers/thelper_function.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunction.isDarkMode(context);
    return DefaultTabController(
        length: 4,
        initialIndex: 1,
        child: Scaffold(
          //
          //Appbar
          appBar: AppBar(
            backgroundColor: dark
                ? Tcolors.whatsAppGreen.withOpacity(0.7)
                : Tcolors.whatsAppGreen,
            automaticallyImplyLeading: false,
            title: const Text(Ttext.homepageTitlte),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
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
