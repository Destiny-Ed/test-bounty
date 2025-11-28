import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/screens/auth/login.dart';
import 'package:test_bounty/screens/auth/social_auth.dart';
import 'role_selection_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (i) => setState(() => _currentPage = i),
            children: [
              _page(
                "Get paid for your feedback",
                "turn your time into cash rewards by testing the latest mobile apps",
                Icons.paid,
              ),
              _page(
                "test pre-release apps",
                "try out new apps from top developers before they launch and influence their final decision",
                Icons.bug_report,
              ),
              _page(
                "withdraw instantly",
                "your earnings, your way. Securely withdraw your rewards to paypay, bank accounts, or gift cards in just few taps!",
                Icons.group,
              ),
            ],
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (i) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: i == _currentPage ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: i == _currentPage
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SocialAuthScreen(),
                        ),
                      );
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.ease,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    _currentPage == 2 ? "Get Started" : "Next",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _page(String title, String desc, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 120, color: const Color(0xFF0066FF)),
          const SizedBox(height: 50),
          Text(
            title.cap,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.headlineLarge!.copyWith(fontSize: 32),
          ),
          const SizedBox(height: 20),
          Text(
            desc.capitalize,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
