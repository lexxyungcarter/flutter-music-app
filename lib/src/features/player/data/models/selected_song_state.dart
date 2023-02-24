import 'song.dart';

class SelectedSongState {
  final bool? isPlaying;
  final Song? song;

  bool get hasSongOnTrack => song != null;

  SelectedSongState({
    this.isPlaying = false,
    this.song,
  });

  SelectedSongState copyWith({
    bool? isPlaying,
    Song? song,
  }) {
    return SelectedSongState(
      isPlaying: isPlaying ?? this.isPlaying,
      song: song ?? this.song,
    );
  }

  factory SelectedSongState.initial() => SelectedSongState(
        isPlaying: false,
      );
}
