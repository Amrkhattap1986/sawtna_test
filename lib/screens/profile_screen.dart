import 'package:flutter/material.dart';
import 'gifts_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FC),
      appBar: AppBar(title: const Text('My Profile')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const CircleAvatar(
            radius: 55,
            child: Icon(Icons.person, size: 60),
          ),
          const SizedBox(height: 12),
          const Center(
            child: Text('Alby User',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 25),
          Card(
            child: ListTile(
              leading: const Text('🪙', style: TextStyle(fontSize: 28)),
              title: const Text('My Coins'),
              subtitle: const Text('1,200 Coins'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              leading: const Text('🎁', style: TextStyle(fontSize: 28)),
              title: const Text('My Gifts'),
              subtitle: const Text('View received gifts'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const GiftsScreen(),
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
