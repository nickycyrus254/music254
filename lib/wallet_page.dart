import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Melody Wallet"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Card(
              child: ListTile(
                leading: Icon(Icons.account_balance_wallet),
                title: Text("Wallet Balance"),
                subtitle: Text("\$0.00"),
              ),
            ),
            SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: Icon(Icons.upload),
                title: Text("Withdraw Earnings"),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                leading: Icon(Icons.history),
                title: Text("Transaction History"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
