import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_app_ui/views/detailed_chat/detailed_chat_viewmodel/detail_chat_view_model.dart';
import 'package:whats_app_ui/views/detailed_chat/widget/buttom_textfield.dart';
import 'package:whats_app_ui/views/detailed_chat/widget/detailed_chat_appbar.dart';
import 'package:whats_app_ui/views/home_view/home_view_model/user_data_viewmodel.dart';

import 'package:whats_app_ui/utils/constants/t_colors.dart';

class DetailChatView extends StatelessWidget {
  const DetailChatView({super.key, this.index});
  final int? index;

  @override
  Widget build(BuildContext context) {
    //calling ViewModel of DetailChatProvider
    final detailChatProvider = Provider.of<DetailChatViewModel>(context);

    //
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserDataViewModel>(context, listen: false)
          .getPostData(context);
    });

    return Consumer<DetailChatViewModel>(
      builder: (context, ins, child) {
        final userData = context.read<UserDataViewModel>();
        return Scaffold(
          //
          //AppBar
          appBar: DetailedChatAppBar(userData: userData, index: index ?? 0),
          //
          //body
          body: Stack(children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: ListView.builder(
                    shrinkWrap: false,
                    itemCount: ins.chats.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          '  ${ins.chats[index]} ',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  backgroundColor: index % 2 == 0
                                      ? Tcolors.whatsAppGreen
                                      : Colors.grey),
                          textAlign: index % 2 == 0
                              ? TextAlign.right
                              : TextAlign.start,
                        ),
                      );
                    })),

            //
            //bottom text field
            ButtomTextField(
                messageController: detailChatProvider.messageController)
          ]),
        );
      },
    );
  }
}
