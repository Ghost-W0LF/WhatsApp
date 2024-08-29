import 'package:flutter/material.dart';
import 'package:whats_app_ui/constants/colors.dart';
import 'package:whats_app_ui/screens/chatScreen.dart';
import 'package:whats_app_ui/screens/loginPage.dart';

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
            title: Text('WhatsApp'),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
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
          body:const TabBarView(
            children: [
              Icon(Icons.directions_bike),
              Chatscreen(),
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
              onPressed: () {},
              icon: Icon(Icons.message_rounded),
              color: Colors.white,
            ),
          ),
        ));
  }
}
