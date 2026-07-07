import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1023),
      appBar: AppBar(
        title: const Text("MelodyVerse AI"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            "Welcome Creator 👋",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),

          _menuCard(Icons.music_note, "Creator Studio"),
          _menuCard(Icons.radio, "MelodyVerse Radio"),
          _menuCard(Icons.tv, "MelodyVerse TV"),
          _menuCard(Icons.account_balance_wallet, "Melody Wallet"),
          _menuCard(Icons.person, "Profile"),
        ],
      ),
    );
  }

  Widget _menuCard(IconData icon, String title) {
    return Card(
      color: const Color(0xFF1B2242),
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Icon(icon, color: Colors.amber),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white54),
      ),
    );
  }
}
