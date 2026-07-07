import 'package:flutter/material.dart';
import 'song_generator_page.dart';

class CreatorStudio extends StatelessWidget {
  const CreatorStudio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Creator Studio"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.music_note),
              title: Text("AI Song Generator"),
              subtitle: Text("Create songs from text prompts"),
            ),
          ),
          SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: Icon(Icons.mic),
              title: Text("AI Voice Studio"),
              subtitle: Text("Generate and clone voices"),
            ),
          ),
          SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: Icon(Icons.library_music),
              title: Text("Beat Maker"),
              subtitle: Text("Create beats with AI"),
            ),
          ),
          SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: Icon(Icons.auto_awesome),
              title: Text("Lyrics Writer"),
              subtitle: Text("Generate lyrics instantly"),
            ),
          ),
        ],
      ),
    );
  }
}
