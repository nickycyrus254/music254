import 'package:flutter/material.dart';
import 'services/song_service.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final songs = SongService.getSongs();

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Projects"),
      ),
      body: songs.isEmpty
          ? const Center(
              child: Text(
                "No saved songs yet.",
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];

                return Card(
                  margin: const EdgeInsets.all(12),
                  child: ListTile(
                    leading: const Icon(Icons.music_note),
                    title: Text(song.title),
                    subtitle: Text(song.genre),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                );
              },
            ),
    );
  }
}
