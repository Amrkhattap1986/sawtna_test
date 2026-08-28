import 'package:flutter/material.dart';
import 'admin_users.dart';
import 'admin_rooms.dart';
import 'admin_reports.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final List<Map<String, dynamic>> gifts = [
    {'emoji': '🎁', 'name': 'Gift Box', 'price': 10, 'category': 'Popular'},
    {'emoji': '🌹', 'name': 'Rose', 'price': 20, 'category': 'Love'},
    {'emoji': '❤️', 'name': 'Heart', 'price': 50, 'category': 'Love'},
    {'emoji': '💎', 'name': 'Diamond', 'price': 500, 'category': 'Luxury'},
    {'emoji': '👑', 'name': 'Crown', 'price': 1000, 'category': 'Luxury'},
    {'emoji': '🚀', 'name': 'Rocket', 'price': 500, 'category': 'Special'},
    {'emoji': '🍀', 'name': 'Lucky Clover', 'price': 100, 'category': 'Lucky'},
    {'emoji': '🧧', 'name': 'Lucky Red', 'price': 500, 'category': 'Lucky'},
  ];

  final List<String> categories = [
    'Popular',
    'Love',
    'Luxury',
    'Special',
    'Lucky',
  ];

  void addGift() {
    final name = TextEditingController();
    final price = TextEditingController();
    final emoji = TextEditingController(text: '🎁');

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Add Gift'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emoji,
                decoration: const InputDecoration(labelText: 'Emoji'),
              ),
              TextField(
                controller: name,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: price,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Coins'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final value = int.tryParse(price.text) ?? 0;

                if (name.text.trim().isEmpty || value <= 0) {
                  return;
                }

                setState(() {
                  gifts.add({
                    'emoji': emoji.text.isEmpty ? '🎁' : emoji.text,
                    'name': name.text.trim(),
                    'price': value,
                    'category': 'Popular',
                  });
                });

                Navigator.pop(dialogContext);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void deleteGift(int index) {
    setState(() {
      gifts.removeAt(index);
    });
  }

  void openUsers() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AdminUsers(),
      ),
    );
  }

  void openRooms() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AdminRooms(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF11101A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF191627),
        foregroundColor: Colors.white,
        title: const Text('Sawtna Admin'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: openUsers,
                icon: const Icon(Icons.people),
                label: const Text('Users Management'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: openRooms,
                icon: const Icon(Icons.mic),
                label: const Text('Live Rooms Management'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdminReports(),
                    ),
                  );
                },
                icon: const Icon(Icons.report),
                label: const Text('Reports Management'),
              ),
            ),
          ),
          const Divider(color: Colors.white24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                const Text(
                  'Gifts Management',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                FloatingActionButton.small(
                  onPressed: addGift,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFF211B31),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    categories[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: gifts.length,
              itemBuilder: (context, index) {
                final gift = gifts[index];

                return Card(
                  color: const Color(0xFF211B31),
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: Text(
                      gift['emoji'] as String,
                      style: const TextStyle(fontSize: 32),
                    ),
                    title: Text(
                      gift['name'] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '${gift['category']} • 🪙 ${gift['price']}',
                      style: const TextStyle(color: Colors.white60),
                    ),
                    trailing: IconButton(
                      onPressed: () => deleteGift(index),
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
