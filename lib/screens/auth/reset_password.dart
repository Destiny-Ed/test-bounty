import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/gen/assets.gen.dart';
import 'package:test_bounty/screens/auth/new_password.dart';
import 'package:test_bounty/widgets/form_field.dart';
import 'package:test_bounty/widgets/social_button.dart';

class Reset extends StatefulWidget {
  const Reset({Key? key}) : super(key: key);

  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
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
                      //Header text
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
                            5.height(),

                            Text(
                              "Enter your username or email and we'll send you a link to get back into your account.",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                      20.height(),

                      //Email
                      CustomTextField(password: false, hint: "Email/Username"),

                      50.height(),

                      //Reset Button
                      CustomButton(text: "Submit"),
                      20.height(),

                      //Don't have an account
                      Container(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => NewPassword()),
                            );
                          },
                          child: Text(
                            "Have Code?",
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
