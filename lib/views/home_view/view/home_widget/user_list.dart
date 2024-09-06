import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_app_ui/base/navigation/navigation_service.dart';
import 'package:whats_app_ui/utils/constants/t_colors.dart';
import 'package:whats_app_ui/utils/constants/assets/t_image.dart';
import 'package:whats_app_ui/views/home_view/model/user_data_provider.dart.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //passing in the function (a callback) we wan to execute after the current frame finish rendering

      Provider.of<UserDataProvider>(context, listen: false)
          .getPostData(context);
    });
    NavigationService service = NavigationService();

    return Consumer<UserDataProvider>(builder: (context, userData, child) {
      return userData.isLoading
          ? const CircularProgressIndicator()
          : ListView.builder(
              itemCount: userData.data.data?.length,
              itemBuilder: (_, index) {
                return ListTile(
                  //
                  //
                  //Gesture detector
                  onTap: () {
                    service.replaceTo(
                      '/detailedChat',arguments: index
                    );
                  },
                  //
                  //Profile picture
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        userData.data.data?[index].avatar ??
                            TImage.networkImage),
                  ),
                  //
                  //UserName and message
                  title: Text(
                    userData.data.data?[index].email ?? "no data",
                    style: Theme.of(context).textTheme.headlineSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: const Text("Hi"),
                  trailing: Column(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Tcolors.whatsAppGreen),
                        child: const Center(
                          child: Text("2"),
                        ),
                      )
                    ],
                  ),
                );
              });
    });
  }
}
