import 'package:flutter/material.dart';

class DetailChatProvider extends ChangeNotifier {
  List<String> chats = [];

   updateChat(TextEditingController messageController) {
    chats.add(messageController.text);

    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
