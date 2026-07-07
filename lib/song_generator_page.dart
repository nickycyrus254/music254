import 'package:flutter/material.dart';

class SongGeneratorPage extends StatefulWidget {
  const SongGeneratorPage({super.key});

  @override
  State<SongGeneratorPage> createState() => _SongGeneratorPageState();
}

class _SongGeneratorPageState extends State<SongGeneratorPage> {
  String generatedLyrics = "";

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
            decoration: const InputDecoration(
              labelText: "Song Title",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          TextField(
            decoration: const InputDecoration(
              labelText: "Genre (Afrobeats, Gospel, Hip Hop...)",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          TextField(
            decoration: const InputDecoration(
              labelText: "Artist Style",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          TextField(
            decoration: const InputDecoration(
              labelText: "Language",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          TextField(
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: "Describe your song",
              hintText: "Example: A romantic Afrobeat song in Swahili...",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  generatedLyrics = '''
🎵 MelodyVerse AI Demo

Verse 1
This is your first AI-generated song.
Dream it. Build it. Sing it.

Chorus
MelodyVerse AI,
Where music ideas become reality.
''';
                });
              },
              icon: const Icon(Icons.auto_awesome),
              label: const Text("Generate Song"),
            ),
          ),

          const SizedBox(height: 24),

          if (generatedLyrics.isNotEmpty)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  generatedLyrics,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
