import 'package:flutter/material.dart';
import 'package:whats_app_ui/base/widgets/cust_text_formfield.dart';
import 'package:whats_app_ui/utils/constants/t_text.dart';
import 'package:whats_app_ui/utils/validator/text_form_validator.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
    required GlobalKey<FormState> signUpKey,
    required this.nameController,
    required this.emailComtroller,
    required this.passwordController,
  }) : _signUpKey = signUpKey;

  final GlobalKey<FormState> _signUpKey;
  final TextEditingController nameController;
  final TextEditingController emailComtroller;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
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
                    validator:TextFormValidators().userNameValidators,
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
              validator:TextFormValidators().emailValidators,
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
              validator:TextFormValidators().passwordValidators,
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
        ));
  }
}
