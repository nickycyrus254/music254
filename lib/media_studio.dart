import 'package:flutter/material.dart';

class MediaStudio extends StatefulWidget {
  const MediaStudio({super.key});

  @override
  State<MediaStudio> createState() => _MediaStudioState();
}

class _MediaStudioState extends State<MediaStudio> {
  String imageStyle = "Modern";

  final styles = [
    "Modern",
    "Afrofuturistic",
    "Neon",
    "Minimal",
    "Vintage",
    "3D",
    "Anime",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          const Text(
            "Media Studio",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Container(
            height: 220,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Icon(
                Icons.image,
                size: 80,
                color: Colors.grey,
              ),
            ),
          ),

          const SizedBox(height: 20),

          DropdownButtonFormField<String>(
            value: imageStyle,
            decoration: const InputDecoration(
              labelText: "Cover Art Style",
              border: OutlineInputBorder(),
            ),
            items: styles.map((style) {
              return DropdownMenuItem(
                value: style,
                child: Text(style),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                imageStyle = value!;
              });
            },
          ),

          const SizedBox(height: 25),

          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Generating $imageStyle cover art...",
                  ),
                ),
              );
            },
            icon: const Icon(Icons.auto_awesome),
            label: const Text("Generate Cover Art"),
          ),

          const SizedBox(height: 12),

          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Creating lyric video..."),
                ),
              );
            },
            icon: const Icon(Icons.video_library),
            label: const Text("Generate Lyric Video"),
          ),
        ],
      ),
    );
  }
}
