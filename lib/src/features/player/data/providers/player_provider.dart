import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

import '../models/player_state.dart' as custom_player_state;
import '../models/seek_bar_data.dart';
import '../models/song.dart';

final playerProvider =
    StateNotifierProvider<PlayerStateNotifier, custom_player_state.PlayerState>(
        (ref) => PlayerStateNotifier(
            custom_player_state.PlayerState.initial(), AudioPlayer()));

class PlayerStateNotifier
    extends StateNotifier<custom_player_state.PlayerState> {
  final AudioPlayer _player;

  PlayerStateNotifier(custom_player_state.PlayerState state, this._player)
      : super(state);

  AudioPlayer getPlayerInstance() {
    return _player;
  }

  void addSongToQueue(Song song) {
    state = state.copyWith(
      queue: [...?state.queue, song],
    );
  }

  void removeSongFromQueue(Song song) {
    // TODO: remove song from queue
    // state = state.copyWith(
    //   queue: state.queue.
    // );
  }

  void playSong(Song song) {
    state = state.copyWith(
      currentSong: song,
    );

    _player.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(Uri.parse('asset:///${song.url}')),
        ],
      ),
    );

    play();
  }

  void play() {
    // TODO: show notification
    _player.play();
  }

  void stop() {
    _player.stop();
  }

  void pause() {
    _player.pause();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}

final seekBarDataStreamProvider = StreamProvider<SeekBarData>((ref) {
  final player = ref.read(playerProvider.notifier).getPlayerInstance();
  return rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
      player.positionStream,
      player.durationStream,
      (position, duration) =>
          SeekBarData(position: position, duration: duration ?? Duration.zero));
});
