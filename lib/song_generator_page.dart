import 'package:flutter/material.dart';

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

          const SizedBox(height:16),

          TextField(
            controller: genreController,
            decoration: const InputDecoration(
              labelText: "Genre",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height:16),

          TextField(
            controller: moodController,
            decoration: const InputDecoration(
              labelText: "Mood",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height:16),

          TextField(
            controller: artistController,
            decoration: const InputDecoration(
              labelText: "Artist Style",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height:16),

          TextField(
            controller: promptController,
            maxLines:6,
            decoration: const InputDecoration(
              labelText: "Describe your song",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height:24),

          ElevatedButton.icon(
            icon: const Icon(Icons.auto_awesome),
            label: const Text("Generate Song"),
            onPressed: (){

              setState(() {

                lyrics = """

🎵 ${titleController.text}

Genre: ${genreController.text}

Mood: ${moodController.text}

Inspired by: ${artistController.text}


Verse 1

${promptController.text}

This is where the real AI will generate complete lyrics.


Chorus

MelodyVerse AI

Where music ideas become reality.

""";

              });

            },
          ),

          const SizedBox(height:30),

          if(lyrics.isNotEmpty)

            Card(
              elevation:4,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Text(
                  lyrics,
                  style: const TextStyle(fontSize:18),
                ),
              ),
            )

        ],
      ),
    );
  }
}
