import 'package:flutter/material.dart';
import 'creator_studio.dart';
import 'radio_page.dart';
import 'tv_page.dart';
import 'wallet_page.dart';
import 'profile_page.dart';
import 'settings_page.dart';

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
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            "Welcome Creator ⭐",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "Create. Inspire. Earn.",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 30),

          _menuCard(
            context,
            Icons.auto_awesome,
            "Creator Studio",
            const CreatorStudio(),
          ),

          _menuCard(
            context,
            Icons.radio,
            "MelodyVerse Radio",
            const RadioPage(),
          ),

          _menuCard(
            context,
            Icons.live_tv,
            "MelodyVerse TV",
            const TvPage(),
          ),

          _menuCard(
            context,
            Icons.account_balance_wallet,
            "Melody Wallet",
            WalletPage(),
          ),

          _menuCard(
            context,
            Icons.person,
            "Creator Profile",
            ProfilePage(),
          ),

          _menuCard(
            context,
            Icons.settings,
            "Settings",
            SettingsPage(),
          ),
        ],
      ),
    );
  }

  Widget _menuCard(
    BuildContext context,
    IconData icon,
    String title,
    Widget page,
  ) {
    return Card(
      color: const Color(0xFF1B2242),
      margin: const EdgeInsets.only(bottom: 18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(18),
        leading: Icon(
          icon,
          color: Colors.amber,
          size: 34,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white70,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => page,
            ),
          );
        },
      ),
    );
  }
}
