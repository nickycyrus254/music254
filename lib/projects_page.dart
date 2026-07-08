import 'package:flutter/material.dart';
import 'models/song.dart';
import 'services/song_service.dart';
import 'workspace_page.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    final List<Song> songs = SongService.getSongs();

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
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.music_note),
                    ),
                    title: Text(song.title),
                    subtitle: Text(
                      "${song.genre} • ${song.mood}",
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => WorkspacePage(song: song)
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
