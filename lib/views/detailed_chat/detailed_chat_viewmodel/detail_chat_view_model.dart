import 'package:flutter/material.dart';

class DetailChatViewModel extends ChangeNotifier {
  TextEditingController messageController = TextEditingController();
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
