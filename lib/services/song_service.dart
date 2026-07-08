import '../models/song.dart';

class SongService {
  static final List<Song> songs = [];

  static void saveSong(Song song) {
    songs.add(song);
  }

  static List<Song> getSongs() {
    return songs;
  }
}
