class ChatList {
  ChatList({
    required this.userName,
    required this.imageUrl,
    required this.message,
    required this.time,
  });
  String userName;
  String message;
  String time;
  String imageUrl;
}

List<ChatList> chatDetailes = [
  ChatList(
      userName: "User1",
      message: "Hi!",
      time: "2:12",
      imageUrl: "assets/logo.png"),
  ChatList(
      userName: "User2",
      message: "GoodMorning ☀️!",
      time: "9:42",
      imageUrl: "assets/logo.png"),
  ChatList(
      userName: "User3",
      message: "Where are you!",
      time: "10:23",
      imageUrl: "assets/logo.png"),
  ChatList(
      userName: "User4",
      message: "how are you!",
      time: "6:20",
      imageUrl: "assets/logo.png"),
  ChatList(
      userName: "User5",
      message: "K cha!",
      time: "2:12",
      imageUrl: "assets/logo.png"),
  ChatList(
      userName: "User6",
      message: "kata Ho!",
      time: "2:12",
      imageUrl: "assets/logo.png"),
];
