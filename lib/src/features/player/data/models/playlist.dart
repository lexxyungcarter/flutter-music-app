// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'song.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({
    required this.title,
    required this.songs,
    required this.imageUrl,
  });
}
