import 'package:flutter/material.dart';
import 'package:whats_app_ui/constants/colors.dart';

import 'package:whats_app_ui/screens/contact.dart';

import 'package:whats_app_ui/widgets/chat_listview.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        initialIndex: 1,
        child: Scaffold(
          //
          //Appbar
          appBar: AppBar(
            backgroundColor: TColors.whatsAppGreen,
            automaticallyImplyLeading: false,
            title: const Text('WhatsApp'),
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
              Tab(text: "Chats"),
              Tab(text: "Call"),
              Tab(text: "Status"),
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
                color: TColors.whatsAppGreen,
                borderRadius: BorderRadius.circular(50)),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ContactScreen()),
                );
              },
              icon: const Icon(Icons.message_rounded),
              color: Colors.white,
            ),
          ),
        ));
  }
}
