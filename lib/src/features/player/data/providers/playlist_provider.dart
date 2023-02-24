import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/playlist.dart';
import '../models/selected_playlist_state.dart';
import 'song_provider.dart';

final playlistProvider = Provider<List<Playlist>>((ref) {
  final songs = ref.watch(songsProvider);

  return [
    Playlist(
      title: 'Hip-hop & RnB Mix',
      songs: songs,
      imageUrl:
          'https://admin.musiconline.co/uploads/images/blog/header/hip-hop-muzik-tarihi.jpg',
    ),
    Playlist(
      title: 'Rock & Roll',
      songs: songs,
      imageUrl:
          'https://static.vecteezy.com/system/resources/previews/002/972/281/non_2x/symbol-of-rock-n-roll-concept-art-of-rock-music-in-monochrome-style-vector.jpg',
    ),
    Playlist(
      title: 'Metal',
      songs: [songs.first],
      imageUrl:
          'https://res.cloudinary.com/jerrick/image/upload/f_jpg,fl_progressive,q_auto,w_1024/htz2w34s3mnwkhmjdncx.jpg',
    ),
    Playlist(
      title: 'Techno',
      songs: songs,
      imageUrl:
          'https://musicindustryhowtoimages.s3.amazonaws.com/wp-content/uploads/2022/03/06122217/What-Is-Techno-Music-2.jpg',
    ),
    Playlist(
      title: 'House Music',
      songs: [],
      imageUrl:
          'https://images.unsplash.com/photo-1530014671970-707f86eb10f5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    ),
  ];
});

final selectedPlaylistProvider =
    StateNotifierProvider<SelectedPlaylistNotifier, SelectedPlaylistState>(
        (ref) => SelectedPlaylistNotifier(SelectedPlaylistState.initial()));

class SelectedPlaylistNotifier extends StateNotifier<SelectedPlaylistState> {
  SelectedPlaylistNotifier(super.state);

  void setPlaylist(Playlist playlist) {
    state = state.copyWith(playlist: playlist);
  }

  void toggleShuffle() {
    state = state.copyWith(
      isShuffleOn: !state.isShuffleOn!,
    );
  }
}
