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

  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildTab(String text) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text(widget.song.title),

        bottom: TabBar(

          controller: controller,

          isScrollable: true,

          tabs: const [

            Tab(text: "Lyrics"),

            Tab(text: "Beat"),

            Tab(text: "Melody"),

            Tab(text: "Voice"),

            Tab(text: "Media"),

            Tab(text: "Publish"),

          ],

        ),

      ),

      body: TabBarView(

        controller: controller,

        children: [

          SingleChildScrollView(

            padding: const EdgeInsets.all(20),

            child: Text(
              widget.song.lyrics,
              style: const TextStyle(fontSize: 18),
            ),

          ),

          buildTab("🥁 Beat Studio"),

          buildTab("🎼 Melody Studio"),

          buildTab("🎤 Voice Studio"),

          buildTab("🎬 Media Studio"),

          buildTab("🚀 Publish"),

        ],

      ),

    );

  }

}
