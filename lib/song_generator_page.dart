import 'package:flutter/material.dart';

import 'models/song.dart';
import 'services/song_service.dart';

class SongGeneratorPage extends StatefulWidget {
  const SongGeneratorPage({super.key});

  @override
  State<SongGeneratorPage> createState() => _SongGeneratorPageState();
}

class _SongGeneratorPageState extends State<SongGeneratorPage> {
  final titleController = TextEditingController();
  final genreController = TextEditingController();
  final moodController = TextEditingController();
  final artistController = TextEditingController();
  final promptController = TextEditingController();

  String lyrics = "";

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
            controller: titleController,
            decoration: const InputDecoration(
              labelText: "Song Title",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          TextField(
            controller: genreController,
            decoration: const InputDecoration(
              labelText: "Genre",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          TextField(
            controller: moodController,
            decoration: const InputDecoration(
              labelText: "Mood",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          TextField(
            controller: artistController,
            decoration: const InputDecoration(
              labelText: "Artist Style",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          TextField(
            controller: promptController,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: "Describe your song",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 24),

          ElevatedButton.icon(
            icon: const Icon(Icons.auto_awesome),
            label: const Text("Generate Song"),
            onPressed: () {
              setState(() {
                lyrics = """

🎵 ${titleController.text}

Genre: ${genreController.text}

Mood: ${moodController.text}

Artist Style: ${artistController.text}

Prompt:

${promptController.text}

----------------------------

This is where AI-generated lyrics
will appear in the next version
of MelodyVerse AI.

""";
              });
            },
          ),

          const SizedBox(height: 12),

          ElevatedButton.icon(
            icon: const Icon(Icons.save),
            label: const Text("Save Song"),
            onPressed: () {

              SongService.saveSong(

                Song(

                  title: titleController.text,

                  genre: genreController.text,

                  mood: moodController.text,

                  artist: artistController.text,

                  prompt: promptController.text,

                  lyrics: lyrics,

                ),

              );

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Song saved successfully!"),
                ),
              );

            },
          ),

          const SizedBox(height: 24),

          if (lyrics.isNotEmpty)

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  lyrics,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
