import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_app_ui/views/detailed_chat/detailed_chat_viewmodel/detail_chat_provider.dart';
import 'package:whats_app_ui/views/detailed_chat/view/sub_component_detailed_chat/detailed_chat_appbar.dart';
import 'package:whats_app_ui/views/home_view/model/user_data_provider.dart.dart';
import 'package:whats_app_ui/utils/constants/t_colors.dart';

class DetailChat extends StatelessWidget {
  const DetailChat({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();

    //
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserDataProvider>(context, listen: false)
          .getPostData(context);
    });

    return Consumer<DetailChatProvider>(
      builder: (context, ins, child) {
        final userData = context.read<UserDataProvider>();
        return Scaffold(
          appBar: DetailedChatAppBar(userData: userData, index: index),
          //
          //
          //
          body: Stack(children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: ListView.builder(
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
                    })),

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
                                    .read<DetailChatProvider>()
                                    .updateChat(messageController);

                                messageController.clear();
                              },
                              icon: const Icon(Icons.send))
                        ],
                      )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.photo_camera)),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.mic)),
                    ],
                  ),
                ))
          ]),
        );
      },
    );
  }
}
