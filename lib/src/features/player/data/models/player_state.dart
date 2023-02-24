import 'song.dart';

class PlayerState {
  final bool? isPlaying;
  final bool? isPaused;
  final bool? isStopped;
  final bool? isCompleted;
  final List<Song>? queue;
  final Song? currentSong;

  bool get isPausedOrStopped =>
      (isPaused != null && isPaused!) || (isStopped != null && isStopped!);

  PlayerState({
    this.isPlaying,
    this.isPaused,
    this.isStopped,
    this.isCompleted,
    this.queue,
    this.currentSong,
  });

  PlayerState copyWith({
    bool? isPlaying,
    bool? isPaused,
    bool? isStopped,
    bool? isCompleted,
    List<Song>? queue,
    Song? currentSong,
  }) {
    return PlayerState(
      isPlaying: isPlaying ?? this.isPlaying,
      isPaused: isPaused ?? this.isPaused,
      isStopped: isStopped ?? this.isStopped,
      isCompleted: isCompleted ?? this.isCompleted,
      queue: queue ?? this.queue,
      currentSong: currentSong ?? this.currentSong,
    );
  }

  factory PlayerState.initial() => PlayerState(
        isPlaying: false,
        isPaused: false,
        isStopped: false,
        isCompleted: false,
        queue: [],
      );

  factory PlayerState.reset() => PlayerState(
        isPlaying: false,
        isPaused: false,
        isStopped: false,
        isCompleted: false,
        queue: [],
        currentSong: null,
      );
}
