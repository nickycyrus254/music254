import 'package:flutter/material.dart';

class SongGeneratorPage extends StatefulWidget {
  const SongGeneratorPage({super.key});

  @override
  State<SongGeneratorPage> createState() => _SongGeneratorPageState();
}

class _SongGeneratorPageState extends State<SongGeneratorPage> {
  final TextEditingController promptController = TextEditingController();

  bool showDetails = false;
  bool advancedMode = false;

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

            const SizedBox(height: 10),

            const Text(
              "Create now. Refine later.",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 15),

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
              "Describe your idea in your own words.\nMelodyVerse AI handles the technical details.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: promptController,
              maxLines: 8,
              decoration: InputDecoration(
                hintText:
                    "Example:\nCreate an emotional Afro-pop song about never giving up.",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            const SizedBox(height: 20),

            ListTile(
              title: const Text("Add Details (Optional)"),
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
                decoration: const InputDecoration(
                  labelText: "Genre",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                decoration: const InputDecoration(
                  labelText: "Mood",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                decoration: const InputDecoration(
                  labelText: "Language",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                decoration: const InputDecoration(
                  labelText: "Artist Inspiration",
                  border: OutlineInputBorder(),
                ),
              ),
            ],

            const SizedBox(height: 20),

            SwitchListTile(
              title: const Text("Advanced Mode"),
              subtitle: const Text("Show BPM, Key and other settings"),
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
                decoration: const InputDecoration(
                  labelText: "BPM",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                decoration: const InputDecoration(
                  labelText: "Key",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                decoration: const InputDecoration(
                  labelText: "Song Structure",
                  border: OutlineInputBorder(),
                ),
              ),
            ],

            const SizedBox(height: 30),

            SizedBox(
              width:
