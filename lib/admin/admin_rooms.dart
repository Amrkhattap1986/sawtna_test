import 'package:flutter/material.dart';

class AdminRooms extends StatefulWidget {
  const AdminRooms({super.key});

  @override
  State<AdminRooms> createState() => _AdminRoomsState();
}

class _AdminRoomsState extends State<AdminRooms> {
  final List<Map<String, dynamic>> rooms = [
    {
      'name': 'سهرة الأصدقاء',
      'host': 'Ahmed',
      'users': 128,
      'live': true,
      'locked': false,
    },
    {
      'name': 'Music Night 🎵',
      'host': 'Sara',
      'users': 76,
      'live': true,
      'locked': false,
    },
    {
      'name': 'VIP Lounge 👑',
      'host': 'Mohamed',
      'users': 42,
      'live': true,
      'locked': true,
    },
    {
      'name': 'Gaming Room 🎮',
      'host': 'Mona',
      'users': 19,
      'live': false,
      'locked': false,
    },
  ];

  void toggleLock(int index) {
    setState(() {
      rooms[index]['locked'] = !(rooms[index]['locked'] as bool);
    });
  }

  void toggleLive(int index) {
    setState(() {
      rooms[index]['live'] = !(rooms[index]['live'] as bool);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF11101A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF191627),
        foregroundColor: Colors.white,
        title: const Text('Live Rooms'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          final room = rooms[index];
          final live = room['live'] as bool;
          final locked = room['locked'] as bool;

          return Card(
            color: const Color(0xFF211B31),
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 27,
                    backgroundColor: const Color(0xFF49356D),
                    child: Icon(
                      live ? Icons.mic : Icons.mic_off,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          room['name'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Host: ${room['host']}',
                          style: const TextStyle(color: Colors.white60),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '👥 ${room['users']} users',
                          style: const TextStyle(color: Colors.white60),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        locked
                            ? 'LOCKED'
                            : live
                                ? 'LIVE'
                                : 'OFFLINE',
                        style: TextStyle(
                          color: locked
                              ? Colors.orangeAccent
                              : live
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
                          if (value == 'lock') {
                            toggleLock(index);
                          } else if (value == 'live') {
                            toggleLive(index);
                          }
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 'lock',
                            child: Text(
                              locked ? 'Unlock Room' : 'Lock Room',
                            ),
                          ),
                          PopupMenuItem(
                            value: 'live',
                            child: Text(
                              live ? 'Stop Room' : 'Start Room',
                            ),
                          ),
                        ],
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
