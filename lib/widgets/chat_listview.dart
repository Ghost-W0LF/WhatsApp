import 'package:flutter/material.dart';
import 'package:whats_app_ui/models/aurh_model.dart';
import 'package:whats_app_ui/service/auth_service.dart';

import 'package:whats_app_ui/constants/colors.dart';
import 'package:whats_app_ui/widgets/detail_chat.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({
    super.key,
  });

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  AuthService authService = AuthService();
  Auth? _auth;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchUserData();
  }

  void fetchUserData() async {
    AuthService authService = AuthService();
    Auth auth = await authService.fetchUser();
    setState(() {
      _auth = auth;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _auth?.data?.length ?? 4,
        itemBuilder: (_, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetailChat()),
              );
            },
            //
            //Profile picture
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  _auth?.data?[index].avatar.toString() ?? "assets/logo.png"),
            ),
            //
            //UserName and message
            title: Text(
              _auth?.data?[index].email.toString() ?? "no data",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            subtitle: Text("Hi"),
            trailing: Column(
              children: [
                /*    Text(chatDetailes[index].time), */
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: TColors.whatsAppGreen),
                  child: const Center(
                    child: Text("2"),
                  ),
                )
              ],
            ),
          );
        });
  }
}
