import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/gen/assets.gen.dart';
import 'package:test_bounty/screens/auth/login.dart';
import 'package:test_bounty/widgets/form_field.dart';
import 'package:test_bounty/widgets/social_button.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: MediaQuery.of(context).size.height - 40,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Center(
                  child: ListView(
                    primary: false,
                    shrinkWrap: true,
                    children: [
                      //Header Text
                      Container(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Theme.of(context).cardColor,
                              child: Image.asset(
                                Assets.icons.google.path,
                                width: MediaQuery.of(context).size.width - 100,
                              ),
                            ),
                            10.height(),
                            Text(
                              "Reset Password",
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),

                            const SizedBox(height: 5),

                            Text(
                              "Enter the code you received and a new password",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                      20.height(),

                      //Code
                      CustomTextField(password: false, hint: "Code"),
                      20.height(),

                      //Password
                      CustomTextField(hint: "Password"),

                      50.height(),

                      //Submit Button
                      CustomButton(text: "Submit"),

                      //Login with new account account
                      Container(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => LoginView()),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
