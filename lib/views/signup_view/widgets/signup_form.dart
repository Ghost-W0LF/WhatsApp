import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_app_ui/base/widgets/cust_text_formfield.dart';
import 'package:whats_app_ui/utils/constants/t_text.dart';
import 'package:whats_app_ui/utils/validator/text_form_validator.dart';
import 'package:whats_app_ui/views/signup_view/signup_view_model/signup_viewmodel.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final signupViewmodel = Provider.of<SignupViewmodel>(context);
    return Form(
        key: signupViewmodel.signUpKey,
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
                    controller:signupViewmodel.nameController,
                    validator: TextFormValidators().userNameValidators,
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
              controller:signupViewmodel.emailComtroller,
              validator: TextFormValidators().emailValidators,
              hintText: Ttext.email,
              iconData: Icons.email,
            ),
            const SizedBox(
              height: 50,
            ),
            //
            //password
            CustTextFormField(
              controller: signupViewmodel.passwordController,
              validator: TextFormValidators().passwordValidators,
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
