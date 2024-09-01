import 'package:flutter/material.dart';
import 'package:whats_app_ui/utils/constants/t_colors.dart';

import 'package:whats_app_ui/features/home_page/widget/chat_listview.dart';
import 'package:whats_app_ui/base/widgets/cust_list_tile.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Tcolors.whatsAppGreen,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.keyboard_return)),
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Create"),
            //
            //
            const CustListTile(
              iconData: Icons.account_circle,
              title: "New Group",
            ),
            const CustListTile(
              iconData: Icons.person_add,
              title: "New Contact",
              leading: true,
              leadingIcon: Icons.qr_code,
            ),
            const CustListTile(
              iconData: Icons.groups,
              title: "New Community",
            ),
            //
            //
            const Text("Discover"),
            //
            //ListTile
            const CustListTile(
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
            const Expanded(child: ChatListView())
          ],
        ),
      ),
    );
  }
}
