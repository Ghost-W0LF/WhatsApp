import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_app_ui/views/detailed_chat/detailed_chat_viewmodel/detail_chat_provider.dart';
class ButtomTextField extends StatelessWidget {
  const ButtomTextField({
    super.key,
    required this.messageController,
  });

  final TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
        ));
  }
}
