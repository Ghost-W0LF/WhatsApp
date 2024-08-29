import 'package:flutter/material.dart';
import 'package:whats_app_ui/Models/userModel.dart';
import 'package:whats_app_ui/constants/colors.dart';

class Chatscreen extends StatelessWidget {
  const Chatscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: chatDetailes.length,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: (){
                  
                },
                child: ListTile(
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
                ),
              );
            }));
  }
}
/* child: ListTile(
        title: Text('John Doe'),
      ), */