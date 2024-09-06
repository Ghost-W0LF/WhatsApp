import 'package:flutter/material.dart';
import 'package:whats_app_ui/base/navigation/navigation_service.dart';
import 'package:whats_app_ui/utils/constants/assets/t_image.dart';
import 'package:whats_app_ui/utils/constants/t_text.dart';
import 'package:whats_app_ui/views/home_view/model/user_data_viewmodel.dart';

class DetailedChatAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  DetailedChatAppBar({
    super.key,
    required this.userData,
    required this.index,
  });

  final UserdataViewModel userData;
  final int index;
  final NavigationService service = NavigationService();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey,
      //back button
      leading: IconButton(
          onPressed: () {
            NavigationService().replaceTo('/homeView');
          },
          icon: const Icon(Icons.arrow_back_ios)),
      //
      //Title
      title: Row(
        children: [
          //Avatar Image
          CircleAvatar(
            backgroundImage: NetworkImage(
                userData.uData.data?[index].avatar ?? TImage.networkImage),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                //
                //First Name
                child: Text(
                  "${userData.uData.data?[index].firstName}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Text(
                Ttext.tapForContact,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          )
        ],
      ),
      //
      //Action

      actions: const [
        Icon(Icons.videocam_outlined),
        SizedBox(width: 10),
        Icon(Icons.phone_outlined),
        SizedBox(width: 20),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 30);
}
