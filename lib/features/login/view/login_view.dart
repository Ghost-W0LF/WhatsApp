import 'package:flutter/material.dart';
import 'package:whats_app_ui/features/signup/view/signup_view.dart';
import 'package:whats_app_ui/features/home_page/view/home_page.dart';

import 'package:whats_app_ui/features/login/services/login_service.dart';
import 'package:whats_app_ui/base/widgets/cust_divider.dart';
import 'package:whats_app_ui/base/widgets/cust_button.dart';
import 'package:whats_app_ui/base/widgets/cust_text_formfield.dart';
import 'package:whats_app_ui/utils/constants/assets/t_image.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginpageState();
}

class _LoginpageState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final LoginService _loginService = LoginService();

  @override
  Widget build(BuildContext context) {
    void login() async {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      String? token = await _loginService.login(email, password);

      if (token != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        debugPrint('Login successful, token: $token');
      } else {
        if (emailController.text.isEmpty ||
            !emailController.text.contains('@') ||
            !emailController.text.contains('.com')) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Invalid Email'),
            ),
          );
        } else if (passwordController.text.isEmpty ||
            passwordController.text.length != 8) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Invalid Password'),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Invalid Email or Password'),
            ),
          );
        }

        // Show an error message
        debugPrint('Login failed: $token');
      }
    }

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  "Welcome to whats app",
                  style: Theme.of(context).textTheme.displaySmall,
                )),
            //
            //Second text
            const SizedBox(height: 10),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Provide your details, so you can be able to login",
                  style: Theme.of(context).textTheme.bodyLarge,
                )),

            //
            //Login Form
            const SizedBox(height: 30),
            Form(
                child: Column(
              children: [
                CustTextFormField(
                  controller: emailController,
                  hintText: "Email",
                  iconData: Icons.email,
                ),
                const SizedBox(height: 30),
                CustTextFormField(
                  controller: passwordController,
                  obscureText: true,
                  hintText: "Password",
                  iconData: Icons.password,
                ),
              ],
            )),
            //
            //Login button
            const SizedBox(height: 30),
            CustButton(
              text: "Login",
              onPressed: () {
                login();
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
                const Text("If you donot have an account !!"),
                //
                //Signup Button
                CustButton(
                  text: "Signup",
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
