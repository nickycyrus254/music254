import 'package:flutter/material.dart';

import 'models/song.dart';
import 'services/song_service.dart';

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
                  margin: const EdgeInsets.all(12),
                  child: ListTile(
                    leading: const Icon(Icons.music_note),
                    title: Text(song.title),
                    subtitle: Text(
                      "${song.genre} • ${song.mood}",
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),

                    onTap: () {

                      showDialog(

                        context: context,

                        builder: (_) {

                          return AlertDialog(

                            title: Text(song.title),

                            content: SingleChildScrollView(

                              child: Text(song.lyrics),

                            ),

                            actions: [

                              TextButton(

                                onPressed: () {

                                  Navigator.pop(context);

                                },

                                child: const Text("Close"),

                              )

                            ],

                          );

                        },

                      );

                    },

                  ),
                );

              },
            ),
    );
  }
}
