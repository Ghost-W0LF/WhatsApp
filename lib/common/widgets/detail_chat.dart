import 'package:flutter/material.dart';

import 'package:whats_app_ui/data/models/user_data_model.dart';
import 'package:whats_app_ui/data/service/auth_service.dart';
import 'package:whats_app_ui/utils/constants/colors.dart';

class DetailChat extends StatefulWidget {
  const DetailChat({super.key, required this.index});
  final int index;

  @override
  State<DetailChat> createState() => _DetailChatState();
}

class _DetailChatState extends State<DetailChat> {
  List<String> chats = [];

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
    TextEditingController messageController = TextEditingController();

    void updateChat() {
      setState(() {
        chats.add(messageController.text);
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        //
        //Title
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(_auth?.data?[widget.index].avatar ??
                  "https://www.rawpixel.com/search/person%20icon"),
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    '${_auth?.data?[widget.index].email}',
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "tap here for contact info",
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            )
          ],
        ),
        //
        //Action

        actions: const [
          Icon(Icons.videocam_outlined),
          SizedBox(width: 10),
          Icon(Icons.phone_outlined),
          SizedBox(width: 20),
        ],
      ),
      //
      //
      //
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          child: ListView.builder(
              shrinkWrap: false,
              itemCount: chats.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    '  ${chats[index]} ',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        backgroundColor: index % 2 == 0
                            ? Tcolors.whatsAppGreen
                            : Colors.grey),
                    textAlign:
                        index % 2 == 0 ? TextAlign.right : TextAlign.start,
                  ),
                );
              }),
        ),

        //
        //bottom text field
        Positioned(
            bottom: 30,
            child: Container(
              height: 55,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: messageController,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            updateChat();
                            messageController.clear();
                          },
                          icon: const Icon(Icons.send))
                    ],
                  )),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.photo_camera)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.mic)),
                ],
              ),
            ))
      ]),
    );
  }
}
