import 'package:flutter/material.dart';

class MelodyStudio extends StatefulWidget {
  const MelodyStudio({super.key});

  @override
  State<MelodyStudio> createState() => _MelodyStudioState();
}

class _MelodyStudioState extends State<MelodyStudio> {
  String selectedKey = "C";
  String selectedScale = "Major";
  String selectedProgression = "I - V - vi - IV";

  final List<String> keys = [
    "C",
    "C#",
    "D",
    "D#",
    "E",
    "F",
    "F#",
    "G",
    "G#",
    "A",
    "A#",
    "B",
  ];

  final List<String> scales = [
    "Major",
    "Minor",
    "Pentatonic",
    "Blues",
    "Dorian",
    "Mixolydian",
  ];

  final List<String> progressions = [
    "I - V - vi - IV",
    "I - IV - V",
    "ii - V - I",
    "vi - IV - I - V",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [

          const Text(
            "Melody Studio",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 25),

          DropdownButtonFormField<String>(
            value: selectedKey,
            decoration: const InputDecoration(
              labelText: "Musical Key",
              border: OutlineInputBorder(),
            ),
            items: keys.map((key) {
              return DropdownMenuItem(
                value: key,
                child: Text(key),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedKey = value!;
              });
            },
          ),

          const SizedBox(height: 20),

          DropdownButtonFormField<String>(
            value: selectedScale,
            decoration: const InputDecoration(
              labelText: "Scale",
              border: OutlineInputBorder(),
            ),
            items: scales.map((scale) {
              return DropdownMenuItem(
                value: scale,
                child: Text(scale),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedScale = value!;
              });
            },
          ),

          const SizedBox(height: 20),

          DropdownButtonFormField<String>(
            value: selectedProgression,
            decoration: const InputDecoration(
              labelText: "Chord Progression",
              border: OutlineInputBorder(),
            ),
            items: progressions.map((progression) {
              return DropdownMenuItem(
                value: progression,
                child: Text(progression),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedProgression = value!;
              });
            },
          ),

          const SizedBox(height: 30),

          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Generating a $selectedScale melody in $selectedKey...",
                  ),
                ),
              );
            },
            icon: const Icon(Icons.piano),
            label: const Text("Generate Melody"),
          ),
        ],
      ),
    );
  }
}
