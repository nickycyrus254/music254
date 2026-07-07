import 'package:flutter/material.dart';

class SongGeneratorPage extends StatelessWidget {
  const SongGeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Song Generator"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Song Title",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),

          TextField(
            decoration: InputDecoration(
              labelText: "Genre (Afrobeats, Gospel, Hip Hop...)",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),

          TextField(
            decoration: InputDecoration(
              labelText: "Artist Style",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),

          TextField(
            decoration: InputDecoration(
              labelText: "Language",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),

          TextField(
            maxLines: 6,
            decoration: InputDecoration(
              labelText: "Describe your song",
              hintText: "Example: A romantic Afrobeat song in Swahili...",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.auto_awesome),
              label: const Text("Generate Song"),
            ),
          ),
        ],
      ),
    );
  }
}
