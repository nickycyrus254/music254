import 'package:flutter/material.dart';
import 'workspace_page.dart';
import 'models/song.dart';

class SongGeneratorPage extends StatefulWidget {
  const SongGeneratorPage({super.key});

  @override
  State<SongGeneratorPage> createState() => _SongGeneratorPageState();
}

class _SongGeneratorPageState extends State<SongGeneratorPage> {
  final TextEditingController promptController = TextEditingController();

  bool showDetails = false;
  bool advancedMode = false;

  final TextEditingController genreController = TextEditingController();
  final TextEditingController moodController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController artistController = TextEditingController();

  final TextEditingController bpmController = TextEditingController();
  final TextEditingController keyController = TextEditingController();
  final TextEditingController structureController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Song Generator"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Create now. Refine later.",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              "🎵 Create with\nMelodyVerse AI",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Describe your song idea. MelodyVerse AI handles the technical work.",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 25),

            TextField(
              controller: promptController,
              maxLines: 6,
              decoration: InputDecoration(
                hintText:
                    "Example:\nCreate an Afro-pop song about hope and resilience.",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),

            const SizedBox(height: 20),

            ListTile(
              title: const Text("Add Details"),
              trailing: Icon(
                showDetails
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
              ),
              onTap: () {
                setState(() {
                  showDetails = !showDetails;
                });
              },
            ),
                        if (showDetails) ...[
              const SizedBox(height: 10),

              TextField(
                controller: genreController,
                decoration: const InputDecoration(
                  labelText: "Genre",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: moodController,
                decoration: const InputDecoration(
                  labelText: "Mood",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: languageController,
                decoration: const InputDecoration(
                  labelText: "Language",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: artistController,
                decoration: const InputDecoration(
                  labelText: "Artist Inspiration",
                  border: OutlineInputBorder(),
                ),
              ),
            ],

            const SizedBox(height: 20),

            SwitchListTile(
              title: const Text("Advanced Mode"),
              subtitle: const Text(
                  "Show BPM, Key and Song Structure settings"),
              value: advancedMode,
              onChanged: (value) {
                setState(() {
                  advancedMode = value;
                });
              },
            ),

            if (advancedMode) ...[
              const SizedBox(height: 10),

              TextField(
                controller: bpmController,
                decoration: const InputDecoration(
                  labelText: "BPM",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: keyController,
                decoration: const InputDecoration(
                  labelText: "Key",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: structureController,
                decoration: const InputDecoration(
                  labelText: "Song Structure",
                  border: OutlineInputBorder(),
                ),
              ),
            ],

            const SizedBox(height: 30),

            SizedBox(
  width: double.infinity,
  height: 55,
  child: ElevatedButton.icon(
    icon: const Icon(Icons.auto_awesome),
    label: const Text(
      "Generate Song",
      style: TextStyle(fontSize: 18),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => WorkspacePage(
            song: Song(
              title: promptController.text.isEmpty
                  ? "Untitled Song"
                  : promptController.text,
              genre: genreController.text,
              mood: moodController.text,
              artist: artistController.text,
              lyrics: "",
            ),
          ),
        ),
      );
    },
  ),
),

const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
