
import 'package:flutter/material.dart';
import 'package:whats_app_ui/base/widgets/cust_text_formfield.dart';
import 'package:whats_app_ui/utils/constants/t_text.dart';
import 'package:whats_app_ui/utils/validator/text_form_validator.dart';
import 'package:whats_app_ui/views/login_view/view_model/login_viewmodel.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required GlobalKey<FormState> loginFormKey,
    required this.loginViewModel,
  }) : _loginFormKey = loginFormKey;

  final GlobalKey<FormState> _loginFormKey;
  final LoginViewModel loginViewModel;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _loginFormKey,
        child: Column(
          children: [
            //
            //eamil
            CustTextFormField(
              controller: loginViewModel.emailController,
              validator: TextFormValidators().emailValidators,
              hintText: Ttext.email,
              iconData: Icons.email,
            ),
            const SizedBox(height: 30),
            //
            //
            //password
            CustTextFormField(
              controller: loginViewModel.passwordController,
              validator: TextFormValidators().passwordValidators,
              obscureText: true,
              hintText: Ttext.password,
              iconData: Icons.password,
            ),
          ],
        ));
  }
}
