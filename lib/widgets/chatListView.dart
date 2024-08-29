import 'package:flutter/material.dart';
import 'package:whats_app_ui/Models/userModel.dart';
import 'package:whats_app_ui/constants/colors.dart';
import 'package:whats_app_ui/widgets/detailChat.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: chatDetailes.length,
        itemBuilder: (_, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailChat()),
              );
            },
            //
            //Profile picture
            leading: CircleAvatar(
              backgroundImage: AssetImage(chatDetailes[index].imageUrl),
            ),
            //
            //UserName and message
            title: Text(
              chatDetailes[index].userName,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            subtitle: Text(chatDetailes[index].message),
            trailing: Column(
              children: [
                Text(chatDetailes[index].time),
                Container(
                  width: 20,
                  height: 20,
                  child: Center(
                    child: Text("2"),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: TColors.whatsAppGreen),
                )
              ],
            ),
          );
        });
  }
}
