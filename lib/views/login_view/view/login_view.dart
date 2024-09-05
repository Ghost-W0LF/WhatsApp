import 'package:flutter/material.dart';
import 'package:whats_app_ui/views/login_view/view_model/user_login_function.dart';
import 'package:whats_app_ui/views/signup_view/view/signup_view.dart';
import 'package:whats_app_ui/base/widgets/cust_divider.dart';
import 'package:whats_app_ui/base/widgets/cust_button.dart';
import 'package:whats_app_ui/base/widgets/cust_text_formfield.dart';
import 'package:whats_app_ui/utils/constants/assets/t_image.dart';
import 'package:whats_app_ui/utils/constants/t_text.dart';
import 'package:whats_app_ui/utils/validator/text_form_validator.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 90),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //
          //Logo
          const SizedBox(
              height: 100,
              width: 100,
              child: Image(image: AssetImage(TImage.logoImage))),
          const SizedBox(height: 30),
          //
          //Text
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                Ttext.loginTitle,
                style: Theme.of(context).textTheme.displaySmall,
              )),
          //
          //Second text
          const SizedBox(height: 10),
          SizedBox(
              child: Text(
            Ttext.loginSubTitle,
            style: Theme.of(context).textTheme.bodyLarge,
          )),

          //
          //Login Form
          const SizedBox(height: 30),
          Form(
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
              )),
          //
          //Login button
          const SizedBox(height: 30),
          CustButton(
            text: Ttext.login,
            //
            //
            //on pressed method
            onPressed: () {
              if (_loginFormKey.currentState!.validate()) {
                loginViewModel.requestLogin(
                  mounted,
                  context,
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Processing Data'),
                    duration: Duration(milliseconds: 500),
                  ),
                );
              } else {
                debugPrint("error");
              }
            },
          ),
          //
          //Divider
          const SizedBox(height: 30),
          const CustDivider(),
          //Text
          const SizedBox(height: 20),
          Row(
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
          )
        ]),
      ),
    );
  }
}
