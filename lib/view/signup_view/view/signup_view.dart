import 'package:flutter/material.dart';

import 'package:whats_app_ui/view/signup_view/services/signup_service.dart';
import 'package:whats_app_ui/base/widgets/cust_button.dart';
import 'package:whats_app_ui/base/widgets/cust_text_formfield.dart';
import 'package:whats_app_ui/utils/constants/t_text.dart';
import 'package:whats_app_ui/utils/validator/validator.dart';

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
            Form(
                key: _signUpKey,
                child: Column(
                  children: [
                    //
                    //First and last name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          //user name
                          child: CustTextFormField(
                            controller: nameController,
                            validator: userNameValidators,
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
                      validator: emailValidators,
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
                      validator: passwordValidators,
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
                if (_signUpKey.currentState!.validate()) {
                  register.registerUser(emailComtroller.text,
                      nameController.text, passwordController.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                } else {
                  debugPrint("error");
                }
              }, /* {

                register.registerUser(emailComtroller.text, nameController.text,
                    passwordController.text);
              }, */
            )
          ],
        ),
      ),
    );
  }
}
