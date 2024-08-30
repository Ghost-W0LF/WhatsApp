import 'package:flutter/material.dart';

import 'package:whats_app_ui/screens/home_page.dart';
import 'package:whats_app_ui/screens/signup_page.dart';
import 'package:whats_app_ui/widgets/divider.dart';
import 'package:whats_app_ui/widgets/elevated_button.dart';
import 'package:whats_app_ui/widgets/text_formfield.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                child: Image(image: AssetImage('assets/logo.png'))),
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
                  emailController: emailController,
                  hintText: "Email",
                  iconData: Icons.email,
                ),
                const SizedBox(height: 30),
                CustTextFormField(
                  emailController: passwordController,
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
       
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Homepage()),
                );
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
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                ),
              ],
            )
          ]),
        ));
  }
}
