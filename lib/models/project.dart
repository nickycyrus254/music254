class Project {
  String id;
  String title;
  String artist;
  String genre;
  String mood;
  String lyrics;
  String beat;
  String melody;
  String voicePath;
  String coverArtPath;
  DateTime createdAt;
  DateTime updatedAt;

  Project({
    required this.id,
    required this.title,
    required this.artist,
    required this.genre,
    required this.mood,
    required this.lyrics,
    this.beat = "",
    this.melody = "",
    this.voicePath = "",
    this.coverArtPath = "",
    required this.createdAt,
    required this.updatedAt,
  });
}
