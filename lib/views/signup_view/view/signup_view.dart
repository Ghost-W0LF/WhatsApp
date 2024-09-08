import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:whats_app_ui/base/widgets/cust_button.dart';

import 'package:whats_app_ui/utils/constants/t_text.dart';
import 'package:whats_app_ui/views/signup_view/signup_view_model/signup_viewmodel.dart';
import 'package:whats_app_ui/views/signup_view/widgets/signup_form.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final signupViewmodel = Provider.of<SignupViewmodel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(Ttext.signup),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.keyboard_return)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Text(
              Ttext.signupYouCanCreat,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(
              height: 30,
            ),
            const SignupForm(),
            //
            //Signup button
            CustButton(
              text: Ttext.creatAccount,
              onPressed: () {
                signupViewmodel.createAccount();
              },
            )
          ],
        ),
      ),
    );
  }
}
