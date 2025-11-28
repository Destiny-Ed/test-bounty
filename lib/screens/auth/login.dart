import 'package:flutter/material.dart';
import 'package:test_bounty/core/constants.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/gen/assets.gen.dart';
import 'package:test_bounty/screens/auth/register.dart';
import 'package:test_bounty/screens/auth/reset_password.dart';
import 'package:test_bounty/screens/role_selection_screen.dart';
import 'package:test_bounty/widgets/form_field.dart';
import 'package:test_bounty/widgets/social_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
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
                      Column(
                        children: [
                          20.height(),
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Theme.of(context).cardColor,
                            child: Image.asset(
                              Assets.icons.google.path,
                              width: MediaQuery.of(context).size.width - 100,
                            ),
                          ),
                          20.height(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 35.0,
                            ),
                            child: Text(
                              "Welcome Back To $appName".cap,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ),
                          10.height(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25.0,
                            ),
                            child: Text(
                              "get rewarded for testing the latest mobile apps"
                                  .capitalize,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          50.height(),

                          CustomTextField(password: false, hint: "Email"),

                          15.height(),

                          //Password
                          CustomTextField(hint: "Password"),

                          //Forgot password?
                          Container(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => Reset()),
                                );
                              },
                              child: Text(
                                "Forgot Password",
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          40.height(),

                          //Login Button
                          CustomButton(
                            text: "Login",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RoleSelectionScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),

                      //Don't have an account
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => Register()),
                                );
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
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
