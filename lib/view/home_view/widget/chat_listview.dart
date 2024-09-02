import 'package:flutter/material.dart';
import 'package:whats_app_ui/view/home_view/model/user_data_model.dart';
import 'package:whats_app_ui/view/home_view/service/uesr_data_service.dart';
import 'package:whats_app_ui/utils/constants/assets/t_image.dart';

import 'package:whats_app_ui/utils/constants/t_colors.dart';
import 'package:whats_app_ui/view/detailed_chat/view/detail_chat.dart';

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
    super.initState();

    fetchUserData();
  }

  void fetchUserData() async {
    UserDataService authService = UserDataService();
    UserData auth = await authService.fetchUser();
    setState(() {
      _auth = auth;
    });
  }

  @override
  Widget build(BuildContext context) {
    //
    //list View builder
    return ListView.builder(
        itemCount: _auth?.data?.length,
        itemBuilder: (_, index) {
          return _auth == null
              ? const CircularProgressIndicator()
              : ListTile(
                  //
                  //
                  //Gesture detector
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
                            TImage.networkImage),
                  ),
                  //
                  //UserName and message
                  title: Text(
                    _auth?.data?[index].email?.toString() ?? "no data",
                    style: Theme.of(context).textTheme.headlineSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: const Text("Hi"),
                  trailing: Column(
                    children: [
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
