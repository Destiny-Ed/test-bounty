import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/gen/assets.gen.dart';
import 'package:test_bounty/widgets/form_field.dart';
import 'package:test_bounty/widgets/social_button.dart';

import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isChecked = false;
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
                    shrinkWrap: true,
                    primary: true,
                    children: [
                      ///Logo and text
                      30.height(),

                      ///
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                            20.height(),
                            Text(
                              "Join the hunt".cap,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            const SizedBox(height: 35),
                          ],
                        ),
                      ),
                      30.height(),
                      //Email
                      CustomTextField(password: false, hint: "Email"),
                      15.height(),

                      //Username
                      CustomTextField(password: false, hint: "Username"),
                      15.height(),

                      //Password
                      CustomTextField(hint: "Password"),

                      // //Agreement?
                      CheckboxListTile(
                        enableFeedback: true,
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0.0,
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                          "I agree to the Terms of Use and Privacy Policy",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      50.height(),

                      //Register Button
                      CustomButton(text: "Register"),

                      //Already have an account
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => LoginView(),
                                  ),
                                );
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      20.height(),
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
