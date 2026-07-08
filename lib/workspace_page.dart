import 'package:flutter/material.dart';
import 'models/song.dart';
import 'beat_studio.dart';
import 'melody_studio.dart';

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
  late TextEditingController _lyricsController;

  double progress = 0.20;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 6, vsync: this);

    _lyricsController = TextEditingController(
      text: widget.song.lyrics,
    );

    _lyricsController.addListener(updateProgress);
  }

  @override
  void dispose() {
    _lyricsController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void updateProgress() {
    double value = 0.20;

    if (_lyricsController.text.trim().isNotEmpty) {
      value += 0.20;
    }

    setState(() {
      progress = value;
    });
  }

  void saveProject() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Project saved successfully."),
      ),
    );
  }

  void publishProject() {
    if (_lyricsController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please write some lyrics before publishing.",
          ),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Project published successfully!"),
      ),
    );
  }

  Widget buildPlaceholder(
    String title,
    IconData icon,
    String description,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Icon(
                  icon,
                  color: Colors.deepPurple,
                  size: 70,
                ),

                const SizedBox(height: 20),

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      floatingActionButton: FloatingActionButton.extended(
        onPressed: saveProject,
        icon: const Icon(Icons.save),
        label: const Text("Save"),
      ),

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,

        title: Text(widget.song.title),

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Column(
            children: [

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [

                    LinearProgressIndicator(
                      value: progress,
                      minHeight: 8,
                      borderRadius:
                          BorderRadius.circular(10),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "${(progress * 100).toInt()}% Complete",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),

                  ],
                ),
              ),
      body: TabBarView(
        controller: _tabController,
        children: [

          /// ==========================
          /// LYRICS TAB
          /// ==========================
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        Text(
                          widget.song.title,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 12),

                        Row(
                          children: [
                            const Icon(Icons.category,
                                color: Colors.deepPurple),
                            const SizedBox(width: 8),
                            Text("Genre: ${widget.song.genre}"),
                          ],
                        ),

                        const SizedBox(height: 8),

                        Row(
                          children: [
                            const Icon(Icons.emoji_emotions,
                                color: Colors.orange),
                            const SizedBox(width: 8),
                            Text("Mood: ${widget.song.mood}"),
                          ],
                        ),

                        const SizedBox(height: 8),

                        Row(
                          children: [
                            const Icon(Icons.person,
                                color: Colors.green),
                            const SizedBox(width: 8),
                            Text("Artist: ${widget.song.artist}"),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Lyrics",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  controller: _lyricsController,
                  maxLines: 20,
                  decoration: InputDecoration(
                    hintText:
                        "Write or edit your lyrics here...",
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                    filled: true,
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: saveProject,
                    icon: const Icon(Icons.save),
                    label: const Text("Save Lyrics"),
                  ),
                ),
              ],
            ),
          ),

          /// ==========================
          /// BEAT TAB
          /// ==========================
          const BeatStudio(),

          /// ==========================
          /// MELODY TAB
          /// ==========================
          const MelodyStudio(),
          
          /// ==========================
          /// VOICE TAB
          /// ==========================
          buildPlaceholder(
            "Voice Studio",
            Icons.mic,
            "Generate AI vocals, harmonies and voice effects.",
          ),

          /// ==========================
          /// MEDIA TAB
          /// ==========================
          buildPlaceholder(
            "Media Studio",
            Icons.movie,
            "Create album artwork, lyric videos and promotional content.",
          ),

          /// ==========================
          /// PUBLISH TAB
          /// ==========================
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      const Icon(
                        Icons.rocket_launch,
                        size: 80,
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

                      const SizedBox(height: 12),

                      Text(
                        "Completion: ${(progress * 100).toInt()}%",
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Publish your finished project when you're satisfied with the lyrics, beat, melody, vocals and media.",
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 30),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: publishProject,
                          icon: const Icon(Icons.publish),
                          label: const Text(
                            "Publish Project",
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
              TabBar(
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

            ],
          ),
        ),
      ),
