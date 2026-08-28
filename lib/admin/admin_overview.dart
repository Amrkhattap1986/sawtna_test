import 'package:flutter/material.dart';

class AdminOverview extends StatelessWidget {
  const AdminOverview({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = [
      {'title': 'Users', 'value': '1,248', 'icon': Icons.people},
      {'title': 'Online Users', 'value': '186', 'icon': Icons.circle},
      {'title': 'Active Rooms', 'value': '42', 'icon': Icons.mic},
      {'title': 'Pending Reports', 'value': '7', 'icon': Icons.report},
      {'title': 'Gifts', 'value': '8', 'icon': Icons.card_giftcard},
      {'title': 'Coins', 'value': '125,400', 'icon': Icons.monetization_on},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF11101A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF191627),
        foregroundColor: Colors.white,
        title: const Text('Admin Overview'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 280,
          mainAxisExtent: 150,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: stats.length,
        itemBuilder: (context, index) {
          final stat = stats[index];

          return Card(
            color: const Color(0xFF211B31),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    stat['icon'] as IconData,
                    color: const Color(0xFF9B7BFF),
                    size: 32,
                  ),
                  const Spacer(),
                  Text(
                    stat['value'] as String,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    stat['title'] as String,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
