import 'package:hive/hive.dart';

part 'project.g.dart';

@HiveType(typeId: 0)
class Project extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String artist;

  @HiveField(3)
  String genre;

  @HiveField(4)
  String mood;

  @HiveField(5)
  String lyrics;

  @HiveField(6)
  String beat;

  @HiveField(7)
  String melody;

  @HiveField(8)
  String voicePath;

  @HiveField(9)
  String coverArtPath;

  @HiveField(10)
  DateTime createdAt;

  @HiveField(11)
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
