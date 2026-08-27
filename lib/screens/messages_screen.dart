import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Messages')),
      body: ListView(
        children: const [
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text('Alby User'),
            subtitle: Text('Welcome to Alby star 👋'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text('Room Host'),
            subtitle: Text('You have a new message'),
            trailing: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
