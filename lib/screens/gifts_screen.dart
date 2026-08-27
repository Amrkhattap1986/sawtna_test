import 'package:flutter/material.dart';

class GiftsScreen extends StatefulWidget {
  const GiftsScreen({super.key});

  @override
  State<GiftsScreen> createState() => _GiftsScreenState();
}

class _GiftsScreenState extends State<GiftsScreen> {
  int coins = 1200;

  final gifts = [
    ['🌹', 'Rose', 10],
    ['❤️', 'Heart', 50],
    ['🎂', 'Cake', 100],
    ['💎', 'Diamond', 500],
    ['👑', 'Crown', 1000],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gifts'),
        actions: [
          Center(child: Text('🪙 $coins')),
          const SizedBox(width: 16),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: gifts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (_, i) {
          final gift = gifts[i];
          return Card(
            child: InkWell(
              onTap: () {
                final price = gift[2] as int;
                if (coins >= price) {
                  setState(() => coins -= price);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${gift[0]} ${gift[1]} sent!  -$price coins',
                      ),
                    ),
                  );
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(gift[0] as String,
                      style: const TextStyle(fontSize: 48)),
                  const SizedBox(height: 8),
                  Text(
                    gift[1] as String,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('🪙 ${gift[2]}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
