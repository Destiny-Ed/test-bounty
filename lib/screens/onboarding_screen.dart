import 'package:flutter/material.dart';
import 'role_selection_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override State<OnboardingScreen> createState() => _OnboardingScreenState();
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
              _page("Earn Real Money", "Test pre-release apps and get paid instantly", Icons.paid),
              _page("Find Bugs Fast", "Help developers launch better apps", Icons.bug_report),
              _page("Join Thousands", "Testers worldwide earning daily", Icons.group),
            ],
          ),
          Positioned(
            bottom: 80,
            left: 0, right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (i) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: i == _currentPage ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: i == _currentPage ? const Color(0xFF00D4B1) : Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  )),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage == 2) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const RoleSelectionScreen()));
                    } else {
                      _controller.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.ease);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00D4B1),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text(_currentPage == 2 ? "Get Started" : "Next", style: const TextStyle(fontSize: 18)),
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
          Text(title, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Text(desc, textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, color: Colors.grey)),
        ],
      ),
    );
  }
}