import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text('Lucknow Explore', style: TextStyle(fontSize: 24))),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Languages'),
            onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/language', (r) => false),
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help'),
            onTap: () => Navigator.pushNamed(context, '/help'),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About Us'),
            onTap: () => Navigator.pushNamed(context, '/about'),
          ),
        ],
      ),
    );
  }
}
