import 'package:flutter/material.dart';
import 'package:whats_app_ui/data/models/user_data_model.dart';
import 'package:whats_app_ui/data/service/auth_service.dart';

import 'package:whats_app_ui/utils/constants/colors.dart';
import 'package:whats_app_ui/common/widgets/detail_chat.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({
    super.key,
  });

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  UserData? _auth;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchUserData();
  }

  void fetchUserData() async {
    AuthService authService = AuthService();
    UserData auth = await authService.fetchUser();
    setState(() {
      _auth = auth;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _auth?.data?.length ?? 4,
        itemBuilder: (_, index) {
          return _auth == null
              ? const CircularProgressIndicator()
              : ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailChat(
                                index: index,
                              )),
                    );
                  },
                  //
                  //Profile picture
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        _auth?.data?[index].avatar.toString() ??
                            "https://www.rawpixel.com/search/person%20icon"),
                  ),
                  //
                  //UserName and message
                  title: Text(
                    _auth?.data?[index].email.toString() ?? "no data",
                    style: Theme.of(context).textTheme.headlineSmall,
                    overflow: TextOverflow.ellipsis,
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
                            color: Tcolors.whatsAppGreen),
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
