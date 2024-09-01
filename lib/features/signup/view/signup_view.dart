import 'package:flutter/material.dart';

import 'package:whats_app_ui/features/signup/services/signup_service.dart';
import 'package:whats_app_ui/base/widgets/cust_button.dart';
import 'package:whats_app_ui/base/widgets/cust_text_formfield.dart';
import 'package:whats_app_ui/utils/constants/t_text.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailComtroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final register = SignupService();

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
            Form(
                child: Column(
              children: [
                //
                //First and last name
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustTextFormField(
                        controller: nameController,
                        hintText: Ttext.firstName,
                        iconData: Icons.person,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //
                //email
                CustTextFormField(
                  controller: emailComtroller,
                  hintText: Ttext.email,
                  iconData: Icons.email,
                ),
                const SizedBox(
                  height: 50,
                ),
                //
                //password
                CustTextFormField(
                  controller: passwordController,
                  hintText: Ttext.password,
                  iconData: Icons.email,
                ),
                const SizedBox(
                  height: 20,
                ),

                const SizedBox(
                  height: 40,
                ),
              ],
            )),
            //
            //Signup button
            CustButton(
              text: Ttext.creatAccount,
              onPressed: () {
                register.registerUser(emailComtroller.text, nameController.text,
                    passwordController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
