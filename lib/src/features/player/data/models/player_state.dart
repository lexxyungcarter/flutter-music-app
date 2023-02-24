import 'song.dart';

class PlayerState {
  final bool? isPlaying;
  final List<Song>? queue;
  final Song? currentSong;

  PlayerState({
    this.isPlaying,
    this.queue,
    this.currentSong,
  });

  PlayerState copyWith({
    bool? isPlaying,
    List<Song>? queue,
    Song? currentSong,
  }) {
    return PlayerState(
      isPlaying: isPlaying ?? this.isPlaying,
      queue: queue ?? this.queue,
      currentSong: currentSong ?? this.currentSong,
    );
  }

  factory PlayerState.initial() => PlayerState(
        isPlaying: false,
        queue: [],
      );
}
