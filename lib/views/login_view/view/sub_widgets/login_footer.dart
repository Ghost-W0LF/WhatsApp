import 'package:flutter/material.dart';
import 'package:whats_app_ui/base/widgets/cust_button.dart';
import 'package:whats_app_ui/utils/constants/t_text.dart';
import 'package:whats_app_ui/views/signup_view/view/signup_view.dart';
class LoginFooter extends StatelessWidget {
  const LoginFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(Ttext.dontHaveAccount),
        //
        //Signup Button
        CustButton(
          text: Ttext.signup,
          isTextButton: true,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignupView()),
            );
          },
        ),
      ],
    );
  }
}
