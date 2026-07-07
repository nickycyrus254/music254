import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MelodyVerse AI"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          MenuCard(
            icon: Icons.auto_awesome,
            title: "Creator Studio",
          ),
          MenuCard(
            icon: Icons.radio,
            title: "MelodyVerse Radio",
          ),
          MenuCard(
            icon: Icons.live_tv,
            title: "MelodyVerse TV",
          ),
          MenuCard(
            icon: Icons.account_balance_wallet,
            title: "Melody Wallet",
          ),
          MenuCard(
            icon: Icons.person,
            title: "Creator Profile",
          ),
          MenuCard(
            icon: Icons.settings,
            title: "Settings",
          ),
        ],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const MenuCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, size: 32),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
