import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_app_ui/views/login_view/widgets/login_footer.dart';
import 'package:whats_app_ui/views/login_view/widgets/login_form.dart';
import 'package:whats_app_ui/views/login_view/widgets/login_headder.dart';

import 'package:whats_app_ui/views/login_view/view_model/login_viewmodel.dart';
import 'package:whats_app_ui/base/widgets/cust_divider.dart';
import 'package:whats_app_ui/base/widgets/cust_button.dart';
import 'package:whats_app_ui/utils/constants/t_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  bool get mounted {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 90),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //
          //Login headder
          //Logo,Title text,Subtitle TExt
          const LoginHeadder(),

          const SizedBox(height: 30),
          

          //
          //Login Form
          LoginForm(
              loginFormKey: loginViewModel.loginFormKey,
              loginViewModel: loginViewModel),
          //
          //Login button
          const SizedBox(height: 30),
          CustButton(
            text: Ttext.login,
            //
            //
            //on pressed method
            onPressed: () {
              loginViewModel.requestLogin();
            },
          ),
          //
          //Divider
          const SizedBox(height: 30),
          const CustDivider(),
          //

          //Footer
          const SizedBox(height: 20),
          const LoginFooter()
        ]),
      ),
    );
  }
}
