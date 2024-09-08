import 'package:flutter/material.dart';
import 'package:whats_app_ui/utils/validator/text_form_validator.dart';

import 'package:whats_app_ui/views/signup_view/services/signup_service.dart';
import 'package:whats_app_ui/base/widgets/cust_button.dart';
import 'package:whats_app_ui/base/widgets/cust_text_formfield.dart';
import 'package:whats_app_ui/utils/constants/t_text.dart';
import 'package:whats_app_ui/views/signup_view/view/sub_component_signup/signup_form.dart';


class SignupView extends StatelessWidget {
  SignupView({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailComtroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _signUpKey = GlobalKey<FormState>();

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
            SignupForm(signUpKey: _signUpKey, nameController: nameController, emailComtroller: emailComtroller, passwordController: passwordController),
            //
            //Signup button
            CustButton(
              text: Ttext.creatAccount,
              onPressed: () {
                if (_signUpKey.currentState!.validate()) {
                  register.registerUser(emailComtroller.text,
                      nameController.text, passwordController.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                } else {
                  debugPrint("error");
                }
              }, 
            )
          ],
        ),
      ),
    );
  }
}
