import 'package:flutter/material.dart';

class AdminUsers extends StatefulWidget {
  const AdminUsers({super.key});

  @override
  State<AdminUsers> createState() => _AdminUsersState();
}

class _AdminUsersState extends State<AdminUsers> {
  final List<Map<String, dynamic>> users = [
    {
      'name': 'Ahmed',
      'id': '10001',
      'coins': 12500,
      'online': true,
      'banned': false,
    },
    {
      'name': 'Sara',
      'id': '10002',
      'coins': 8300,
      'online': true,
      'banned': false,
    },
    {
      'name': 'Mohamed',
      'id': '10003',
      'coins': 2100,
      'online': false,
      'banned': false,
    },
    {
      'name': 'Mona',
      'id': '10004',
      'coins': 45000,
      'online': false,
      'banned': true,
    },
  ];

  void toggleBan(int index) {
    setState(() {
      users[index]['banned'] = !users[index]['banned'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF11101A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF191627),
        foregroundColor: Colors.white,
        title: const Text('Users'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final banned = user['banned'] as bool;
          final online = user['online'] as bool;

          return Card(
            color: const Color(0xFF211B31),
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xFF7B61FF),
                child: Text(
                  (user['name'] as String)[0],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                user['name'] as String,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'ID: ${user['id']} • 🪙 ${user['coins']}',
                style: const TextStyle(color: Colors.white60),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    banned
                        ? 'BANNED'
                        : online
                            ? 'ONLINE'
                            : 'OFFLINE',
                    style: TextStyle(
                      color: banned
                          ? Colors.redAccent
                          : online
                              ? Colors.greenAccent
                              : Colors.white38,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  PopupMenuButton<String>(
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    onSelected: (value) {
                      if (value == 'ban') {
                        toggleBan(index);
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'ban',
                        child: Text(
                          banned ? 'Unban User' : 'Ban User',
                        ),
                      ),
                    ],
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
