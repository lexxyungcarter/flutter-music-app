import 'playlist.dart';

class SelectedPlaylistState {
  final bool? isPlaying;
  final Playlist? playlist;
  final bool? isShuffleOn;

  bool get hasPlaylistOnTrack => playlist != null;

  SelectedPlaylistState({
    this.isPlaying = false,
    this.isShuffleOn = false,
    this.playlist,
  });

  SelectedPlaylistState copyWith({
    bool? isPlaying,
    bool? isShuffleOn,
    Playlist? playlist,
  }) {
    return SelectedPlaylistState(
      isPlaying: isPlaying ?? this.isPlaying,
      isShuffleOn: isShuffleOn ?? this.isShuffleOn,
      playlist: playlist ?? this.playlist,
    );
  }

  factory SelectedPlaylistState.initial() => SelectedPlaylistState(
        isPlaying: false,
        isShuffleOn: false,
      );
}
