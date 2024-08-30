import 'package:flutter/material.dart';
import 'package:whats_app_ui/screens/home_page.dart';
import 'package:whats_app_ui/widgets/elevated_button.dart';
import 'package:whats_app_ui/widgets/text_formfield.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailComtroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup "),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.keyboard_return)),
      ),
      body: SingleChildScrollView(
        padding:const EdgeInsets.all(30),
        child: Column(
          children: [
            Text(
              "You can create account, here!!",
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
                        emailController: nameController,
                        hintText: "First Name",
                        iconData: Icons.person,
                      ),
                    ),
                    Expanded(
                      child: CustTextFormField(
                        emailController: lastNameController,
                        hintText: "Last Name",
                        iconData: Icons.person_2,
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
                  emailController: emailComtroller,
                  hintText: "Email",
                  iconData: Icons.email,
                ),
                const SizedBox(
                  height: 50,
                ),
                //
                //password
                CustTextFormField(
                  emailController: passwordController,
                  hintText: "Password",
                  iconData: Icons.email,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustTextFormField(
                  emailController: rePasswordController,
                  hintText: "Confirm Password",
                  iconData: Icons.email,
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            )),
            //
            //Signup button
            CustButton(
              text: "Creat account",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>const Homepage()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
