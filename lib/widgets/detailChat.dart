import 'package:flutter/material.dart';
import 'package:whats_app_ui/constants/colors.dart';

class DetailChat extends StatefulWidget {
  const DetailChat({super.key});

  @override
  State<DetailChat> createState() => _DetailChatState();
}

class _DetailChatState extends State<DetailChat> {
  List<String> chats = ["hi", 'hello', "how are you"];
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
            icon: Icon(Icons.arrow_back_ios)),
        //
        //Title
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/logo.png"),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "User 1",
                  style: Theme.of(context).textTheme.bodyLarge,
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
          SizedBox(width: 30),
          Icon(Icons.phone_outlined),
          SizedBox(width: 20),
        ],
      ),
      //
      //
      //
      body: Stack(children: [
        ListView.builder(
            itemCount: chats.length,
            itemBuilder: (_, index) {
              return Container(
                decoration: BoxDecoration(
                    color: TColors.whatsAppGreen.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  chats[index],
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              );
            }),

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
                  IconButton(onPressed: () {}, icon: Icon(Icons.add)),
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
                          icon: Icon(Icons.send))
                    ],
                  )),
                  IconButton(onPressed: () {}, icon: Icon(Icons.photo_camera)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.mic)),
                ],
              ),
            ))
      ]),
    );
  }
}
