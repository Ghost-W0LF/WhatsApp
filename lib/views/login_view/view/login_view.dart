import 'package:flutter/material.dart';

import 'package:whats_app_ui/views/home_view/view/home_view.dart';

import 'package:whats_app_ui/views/login_view/services/login_service.dart';
import 'package:whats_app_ui/views/login_view/services/toeken_storage.dart';

import 'package:whats_app_ui/views/signup_view/view/signup_view.dart';
import 'package:whats_app_ui/base/widgets/cust_divider.dart';
import 'package:whats_app_ui/base/widgets/cust_button.dart';
import 'package:whats_app_ui/base/widgets/cust_text_formfield.dart';
import 'package:whats_app_ui/utils/constants/assets/t_image.dart';
import 'package:whats_app_ui/utils/constants/t_text.dart';
import 'package:whats_app_ui/utils/validator/text_form_validator.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginpageState();
}

class _LoginpageState extends State<LoginView> {
  //
  //global key
  final _loginFormKey = GlobalKey<FormState>();

  //text TextEditingController
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
//instance of login
  final LoginService _loginService = LoginService();

  //login function to login
  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    String? token = await _loginService.loginAuth(email, password);

    if (!mounted) return null;
    String tkn = '$token';
    if (token != null) {
      //
      //
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );

      debugPrint('Login successful, token: $tkn');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid Email or Password')),
      );
      //
      //
      // Show an error message
      debugPrint('Login failed: $token');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  //
  //token

  TokenStorage tokenStorage = TokenStorage();
  void checkToken() async {
    String? savedToken = await tokenStorage.readToken();
    if (savedToken != null) {
      setState(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeView()),
        );
      });
    } else {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    checkToken();
  }

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
            width: MediaQuery.of(context).size.width,
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
                  controller: emailController,
                  validator: TextFormValidators().emailValidators,
                  hintText: Ttext.email,
                  iconData: Icons.email,
                ),
                const SizedBox(height: 30),
                //
                //
                //password
                CustTextFormField(
                  controller: passwordController,
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
              login();

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
    ));
  }
}
