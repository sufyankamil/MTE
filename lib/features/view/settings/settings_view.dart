import 'package:flutter/material.dart';

import '../profile/profile_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text("Account"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileView()
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Notifications"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
              },
            ),
            ListTile(
              title: const Text("Privacy"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}

