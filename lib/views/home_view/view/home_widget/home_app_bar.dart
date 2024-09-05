import 'package:flutter/material.dart';
import 'package:whats_app_ui/base/navigation/navigation_service.dart';
import 'package:whats_app_ui/base/tokenstorage/toeken_storage.dart';
import 'package:whats_app_ui/utils/constants/t_text.dart';


class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.tokenStorage,
  });

  final TokenStorage tokenStorage;

  @override
  Widget build(BuildContext context) {
    NavigationService service = NavigationService();
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,

      automaticallyImplyLeading: false,
      title: const Text(Ttext.homepageTitlte),
      actions: [
        IconButton(
            onPressed: () {},
            icon: /*  tkn == null ?const Icon(Icons.search) : */
                const Icon(Icons.search)),
        IconButton(
            onPressed: () {
              tokenStorage.deletToken('token');
              service.replaceTo('/loginView');
            },
            icon: const Icon(Icons.logout))
      ],
      //
      //Tabs
      bottom: const TabBar(tabs: [
        Tab(
          icon: Icon(Icons.group),
        ),
        Tab(text: Ttext.chats),
        Tab(text: Ttext.call),
        Tab(text: Ttext.status),
      ]),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 30);
}
