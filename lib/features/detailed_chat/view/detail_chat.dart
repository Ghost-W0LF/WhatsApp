import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_app_ui/features/detailed_chat/model/detail_chat_model.dart';

import 'package:whats_app_ui/features/home_page/model/user_data_model.dart';
import 'package:whats_app_ui/features/home_page/service/uesr_data_service.dart';
import 'package:whats_app_ui/utils/constants/assets/t_image.dart';
import 'package:whats_app_ui/utils/constants/t_colors.dart';
import 'package:whats_app_ui/utils/constants/t_text.dart';

class DetailChat extends StatefulWidget {
  const DetailChat({super.key, required this.index});
  final int index;

  @override
  State<DetailChat> createState() => _DetailChatState();
}

class _DetailChatState extends State<DetailChat> {
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
    TextEditingController messageController = TextEditingController();

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
              backgroundImage: NetworkImage(
                  _auth?.data?[widget.index].avatar ?? TImage.networkImage),
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
                  Ttext.tapForContact,
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
            child: Consumer<DetailChatModel>(
              builder: (context, ins, child) {
                return ListView.builder(
                    shrinkWrap: false,
                    itemCount: ins.chats.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          '  ${ins.chats[index]} ',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  backgroundColor: index % 2 == 0
                                      ? Tcolors.whatsAppGreen
                                      : Colors.grey),
                          textAlign: index % 2 == 0
                              ? TextAlign.right
                              : TextAlign.start,
                        ),
                      );
                    });
              },
            )),

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
                            context
                                .read<DetailChatModel>()
                                .updateChat(messageController);

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
