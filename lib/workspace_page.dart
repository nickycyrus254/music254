import 'package:flutter/material.dart';
import 'models/song.dart';

class WorkspacePage extends StatefulWidget {
  final Song song;

  const WorkspacePage({
    super.key,
    required this.song,
  });

  @override
  State<WorkspacePage> createState() => _WorkspacePageState();
}

class _WorkspacePageState extends State<WorkspacePage>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildPlaceholder(
    String title,
    IconData icon,
    String description,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              icon,
              size: 70,
              color: Colors.deepPurple,
            ),

            const SizedBox(height: 20),

            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(widget.song.title),
        centerTitle: true,

        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [

            Tab(
              icon: Icon(Icons.lyrics),
              text: "Lyrics",
            ),

            Tab(
              icon: Icon(Icons.music_note),
              text: "Beat",
            ),

            Tab(
              icon: Icon(Icons.piano),
              text: "Melody",
            ),

            Tab(
              icon: Icon(Icons.mic),
              text: "Voice",
            ),

            Tab(
              icon: Icon(Icons.movie),
              text: "Media",
            ),

            Tab(
              icon: Icon(Icons.publish),
              text: "Publish",
            ),

          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: [

          /// Lyrics
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  widget.song.title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "Genre: ${widget.song.genre}",
                ),

                Text(
                  "Mood: ${widget.song.mood}",
                ),

                Text(
                  "Artist: ${widget.song.artist}",
                ),

                const Divider(height: 35),

                const Text(
                  "Lyrics",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  widget.song.lyrics,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),

              ],
            ),
          ),

          /// Beat
          buildPlaceholder(
            "Beat Studio",
            Icons.music_note,
            "Generate and customize AI beats here.",
          ),

          /// Melody
          buildPlaceholder(
            "Melody Studio",
            Icons.piano,
            "Generate AI melodies for your song.",
          ),

          /// Voice
          buildPlaceholder(
            "Voice Studio",
            Icons.mic,
            "Create AI vocals and harmonies.",
          ),

          /// Media
          buildPlaceholder(
            "Media Studio",
            Icons.movie,
            "Generate cover art, videos and promotional media.",
          ),

          /// Publish
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Icon(
                    Icons.rocket_launch,
                    size: 70,
                    color: Colors.green,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Ready to Publish?",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "Your project is ready.\nPublish it whenever you're ready.",
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 30),

                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.publish),
                    label: const Text("Publish Project"),
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
