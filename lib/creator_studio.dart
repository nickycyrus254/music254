import 'package:flutter/material.dart';

class CreatorStudio extends StatelessWidget {
  const CreatorStudio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Creator Studio"),
      ),
      body: const Center(
        child: Text(
          "Welcome to Creator Studio!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
