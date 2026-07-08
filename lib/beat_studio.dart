import 'package:flutter/material.dart';

class BeatStudio extends StatefulWidget {
  const BeatStudio({super.key});

  @override
  State<BeatStudio> createState() => _BeatStudioState();
}

class _BeatStudioState extends State<BeatStudio> {
  double bpm = 120;

  String genre = "Afrobeats";

  final genres = [
    "Afrobeats",
    "Hip Hop",
    "Trap",
    "R&B",
    "Amapiano",
    "Dancehall",
    "Gospel",
    "Pop",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          const Text(
            "Beat Studio",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          DropdownButtonFormField<String>(
            value: genre,
            decoration: const InputDecoration(
              labelText: "Genre",
              border: OutlineInputBorder(),
            ),
            items: genres
                .map(
                  (g) => DropdownMenuItem(
                    value: g,
                    child: Text(g),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                genre = value!;
              });
            },
          ),

          const SizedBox(height: 25),

          Text(
            "Tempo (BPM): ${bpm.round()}",
            style: const TextStyle(fontSize: 18),
          ),

          Slider(
            value: bpm,
            min: 60,
            max: 180,
            divisions: 120,
            label: bpm.round().toString(),
            onChanged: (value) {
              setState(() {
                bpm = value;
              });
            },
          ),

          const SizedBox(height: 25),

          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Generating a $genre beat at ${bpm.round()} BPM...",
                  ),
                ),
              );
            },
            icon: const Icon(Icons.music_note),
            label: const Text("Generate Beat"),
          ),
        ],
      ),
    );
  }
}
