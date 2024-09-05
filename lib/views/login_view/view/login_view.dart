import 'package:flutter/material.dart';
import 'package:whats_app_ui/views/login_view/view/sub_widgets/login_footer.dart';
import 'package:whats_app_ui/views/login_view/view/sub_widgets/login_form.dart';
import 'package:whats_app_ui/views/login_view/view/sub_widgets/login_hedder.dart';
import 'package:whats_app_ui/views/login_view/view_model/check_token.dart';
import 'package:whats_app_ui/views/login_view/view_model/user_login_function.dart';
import 'package:whats_app_ui/base/widgets/cust_divider.dart';
import 'package:whats_app_ui/base/widgets/cust_button.dart';
import 'package:whats_app_ui/utils/constants/t_text.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  //
  //global key
  final _loginFormKey = GlobalKey<FormState>();

  bool get mounted {
    return true;
  }

  final LoginViewModel loginViewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      CheckToken().checkToken(context);
    });

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 90),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //
          //Login headder
          //Logo,Title text,Subtitle TExt
          const LoginHedder(),

          const SizedBox(height: 30),

          //
          //Login Form
          LoginForm(
              loginFormKey: _loginFormKey, loginViewModel: loginViewModel),
          //
          //Login button
          const SizedBox(height: 30),
          CustButton(
            text: Ttext.login,
            //
            //
            //on pressed method
            onPressed: () {
              loginViewModel.requestLogin(mounted, context, _loginFormKey);
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
