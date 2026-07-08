import 'package:flutter/material.dart';
import 'models/song.dart';

class SongDetailsPage extends StatelessWidget {
  final Song song;

  const SongDetailsPage({
    super.key,
    required this.song,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(song.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              song.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              "Genre: ${song.genre}",
              style: const TextStyle(fontSize: 18),
            ),

            Text(
              "Mood: ${song.mood}",
              style: const TextStyle(fontSize: 18),
            ),

            Text(
              "Artist Style: ${song.artist}",
              style: const TextStyle(fontSize: 18),
            ),

            const Divider(height: 40),

            const Text(
              "Lyrics",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              song.lyrics,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
