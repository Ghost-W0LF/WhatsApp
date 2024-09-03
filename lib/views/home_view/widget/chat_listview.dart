import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_app_ui/views/home_view/model/user_data_provider.dart.dart';

import 'package:whats_app_ui/utils/constants/assets/t_image.dart';

import 'package:whats_app_ui/utils/constants/t_colors.dart';
import 'package:whats_app_ui/views/detailed_chat/view/detail_chat.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //passing in the function (a callback) we wan to execute after the current frame finish rendering

      Provider.of<UserDataProvider>(context, listen: false)
          .getPostData(context);
      /*  context.read<UserDataProvider>().getPostData(context); */
    });
    return Consumer<UserDataProvider>(
      builder: (context, userData, child) {
        if (userData.isLoading) {
          return const CircularProgressIndicator();
        } else {
          return ListView.builder(
              itemCount: userData.data.data?.length ??
                  0 /* itemCount: _auth?.data?.length */,
              itemBuilder: (_, index) {
                return ListTile(
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
                    backgroundImage: NetworkImage(userData.data.data?[index]
                            .avatar /* _auth?.data?[index].avatar.toString() */ ??
                        TImage.networkImage),
                  ),
                  //
                  //UserName and message
                  title: Text(
                    userData.data.data?[index]
                            .email /* _auth?.data?[index].email?.toString() */ ??
                        "no data",
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
      },
    );
  }
}

/* 

class ChatListView extends StatefulWidget {
  const ChatListView({
    super.key,
  });

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  /*  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserDataProvider>(context, listen: false)
          .getPostData(context);
    });
  } */
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserDataProvider>(context, listen: false)
          .getPostData(context);
    });
  }
/*   UserData? _auth; */
  /*  @override
  void initState() {
    super.initState();

    fetchUserData();
  }

  void fetchUserData() async {
    UserDataService userDataService = UserDataService();
    UserData auth = await userDataService.fetchUser();
    setState(() {
      _auth = auth;
    });
  } */

  @override
  Widget build(BuildContext context) {
    //
    //list View builder
    return Consumer<UserDataProvider>(
      builder: (context, ins, child) {
        if (ins.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
            itemCount:
                ins.data.data?.length ?? 0 /* itemCount: _auth?.data?.length */,
            itemBuilder: (_, index) {
              return ListTile(
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
                  backgroundImage: NetworkImage(ins.data.data?[index]
                          .avatar /* _auth?.data?[index].avatar.toString() */ ??
                      TImage.networkImage),
                ),
                //
                //UserName and message
                title: Text(
                  ins.data.data?[index]
                          .email /* _auth?.data?[index].email?.toString() */ ??
                      "no data",
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
      },
    );
  }
}
 */
