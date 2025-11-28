// lib/screens/tester/campaign_detail_screen.dart
import 'package:flutter/material.dart';

class CampaignDetailScreen extends StatelessWidget {
  const CampaignDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 240,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('FoodRush Delivery'),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xFF0066FF), Color(0xFF00D4B1)]),
                ),
                child: const Center(child: Icon(Icons.restaurant_menu, size: 100, color: Colors.white70)),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('\$14.00 per test', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF00D4B1))),
                      Chip(
                        backgroundColor: Colors.green[100],
                        label: Text('38 spots left', style: TextStyle(color: Colors.green[800])),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  const Text('Requirements', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  _infoRow(Icons.phone_android, 'Android 13 or higher'),
                  _infoRow(Icons.location_on, 'United States, UK, Canada'),
                  _infoRow(Icons.timer, '7 days test period'),
                  _infoRow(Icons.videocam, 'Screen recording required (≥60s)'),
                  _infoRow(Icons.screenshot, 'Minimum 3 annotated screenshots'),

                  const Divider(height: 40),

                  const Text('Test Instructions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  const Text(
                    '1. Sign up with a new account\n'
                    '2. Complete onboarding\n'
                    '3. Browse restaurants and order food\n'
                    '4. Apply promo code TEST20\n'
                    '5. Complete checkout with test card\n'
                    '6. Rate your experience',
                    style: TextStyle(fontSize: 16, height: 1.6),
                  ),

                  const SizedBox(height: 40),

                  // JOIN BUTTON
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Successfully joined!'), backgroundColor: Colors.green),
                        );
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.play_circle_fill, size: 32),
                      label: const Text('JOIN THIS TEST NOW', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00D4B1),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF0066FF)),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}