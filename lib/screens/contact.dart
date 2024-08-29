import 'package:flutter/material.dart';
import 'package:whats_app_ui/constants/colors.dart';
import 'package:whats_app_ui/screens/signupPage.dart';

import 'package:whats_app_ui/widgets/chatListView.dart';
import 'package:whats_app_ui/widgets/listTile.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.whatsAppGreen,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_return)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "265 Contacts",
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Create"),
            //
            //
            CustListTile(
              iconData: Icons.account_circle,
              title: "New Group",
            ),
            CustListTile(
              iconData: Icons.person_add,
              title: "New Contact",
              leading: true,
              leadingIcon: Icons.qr_code,
            ),
            CustListTile(
              iconData: Icons.groups,
              title: "New Community",
            ),
            //
            //
            Text("Discover"),
            //
            //ListTile
            CustListTile(
              iconData: Icons.store,
              title: "Business",
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Contact on your whats app",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            //
            //Component chat view
            Expanded(child: ChatListView())
          ],
        ),
      ),
    );
  }
}
