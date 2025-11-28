// lib/screens/tester/tester_profile_screen.dart
import 'package:flutter/material.dart';

class TesterProfileScreen extends StatelessWidget {
  const TesterProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF0066FF), Color(0xFF00D4B1)],
                  ),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(radius: 60, backgroundColor: Colors.white, child: Icon(Icons.person, size: 80, color: Color(0xFF0066FF))),
                      SizedBox(height: 16),
                      Text('Michael Torres', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                      Text('Diamond Tester • Level 68', style: TextStyle(fontSize: 18, color: Colors.white70)),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Rank Badge
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [Color(0xFFFFD700), Color(0xFFFFA500)]),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 15, offset: const Offset(0, 8))],
                    ),
                    child: const Column(
                      children: [
                        Icon(Icons.diamond, size: 60, color: Colors.white),
                        SizedBox(height: 12),
                        Text('Diamond Rank', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text('Top 1% of all testers', style: TextStyle(fontSize: 16, color: Colors.white70)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Stats Grid
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      _testerStat('Tests Done', '427', Icons.check_circle, Colors.green),
                      _testerStat('Acceptance', '99.2%', Icons.trending_up, Colors.blue),
                      _testerStat('Total Earned', '\$8,421', Icons.paid, const Color(0xFF00D4B1)),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Streak & Badges
                  Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          const Icon(Icons.local_fire_department, size: 50, color: Colors.orange),
                          const SizedBox(width: 16),
                          const Expanded(child: Text('42-day testing streak!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                          Text('Hot!', style: TextStyle(fontSize: 24, color: Colors.orange[700])),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Settings
                  _sectionTitle('Account'),
                  _testerSettingTile(Icons.wallet, 'Payment Methods', 'PayPal • Crypto', () {}),
                  _testerSettingTile(Icons.history, 'Earnings History', '\$247 this month', () {}),
                  _testerSettingTile(Icons.card_giftcard, 'Redeem Gift Cards', 'Amazon, Apple, etc.', () {}),

                  const SizedBox(height: 20),
                  _sectionTitle('Preferences'),
                  _testerSettingTile(Icons.notifications, 'Push Notifications', 'All campaigns', () {}),
                  _testerSettingTile(Icons.security, 'Privacy Settings', 'Public profile', () {}),
                  _testerSettingTile(Icons.support, 'Help & Support', 'Get help 24/7', () {}),

                  const SizedBox(height: 30),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.red),
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: const Text('Sign Out', style: TextStyle(fontSize: 18, color: Colors.red)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _testerStat(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 36, color: color),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
          Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) => Align(
    alignment: Alignment.centerLeft,
    child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0066FF))),
  );

  Widget _testerSettingTile(IconData icon, String title, String subtitle, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: const Color(0xFF0066FF).withOpacity(0.1), child: Icon(icon, color: const Color(0xFF0066FF))),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}