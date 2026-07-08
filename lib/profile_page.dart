import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Creator Profile"),
      ),
      body: const Center(
        child: Text(
          "Creator Profile Coming Soon",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
