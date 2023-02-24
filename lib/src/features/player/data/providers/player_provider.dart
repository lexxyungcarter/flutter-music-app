import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

import '../../../../utils/helpers.dart';
import '../models/player_state.dart' as custom_player_state;
import '../models/seek_bar_data.dart';
import '../models/song.dart';

final playerProvider = StateNotifierProvider.autoDispose<PlayerStateNotifier,
        custom_player_state.PlayerState>(
    (ref) => PlayerStateNotifier(
        custom_player_state.PlayerState.initial(), AudioPlayer()));

class PlayerStateNotifier
    extends StateNotifier<custom_player_state.PlayerState> {
  final AudioPlayer _player;

  PlayerStateNotifier(custom_player_state.PlayerState state, this._player)
      : super(state) {
    listenToPlayerStream();
  }

  AudioPlayer getPlayerInstance() {
    return _player;
  }

  void listenToPlayerStream() {
    _player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        songHasEnded();
      }
    });
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

    state = state.copyWith(
      isPlaying: true,
      isPaused: false,
      isStopped: false,
      isCompleted: false,
    );
  }

  void stop() {
    _player.stop();

    state = state.copyWith(
      isPlaying: false,
      isPaused: false,
      isStopped: true,
      isCompleted: false,
    );
  }

  void pause() {
    _player.pause();

    state = state.copyWith(
      isPlaying: false,
      isPaused: true,
      isStopped: false,
      isCompleted: false,
    );
  }

  void replay() {
    _player.seek(
      Duration.zero,
      index: _player.effectiveIndices!.first,
    );

    state = state.copyWith(
      isPlaying: true,
      isPaused: false,
      isStopped: false,
      isCompleted: false,
    );
  }

  void togglePlayer() {
    if (state.isCompleted!) {
      replay();
    } else if (state.isPausedOrStopped) {
      play();
    } else {
      pause();
    }
  }

  void goPrevious() {
    if (_player.hasPrevious) {
      _player.seekToPrevious();
    } else {
      showInfoToast('No previous song');
    }
  }

  void seek(Duration? duration) {
    state = state.copyWith(
      isPlaying: true,
      isPaused: false,
      isStopped: false,
    );

    _player.seek(duration);
  }

  void songHasEnded() {
    if (!_player.hasNext) {
      state = state.copyWith(
        isPlaying: false,
        isPaused: false,
        isStopped: true,
        isCompleted: true,
      );
    }
  }

  void goNext() {
    if (_player.hasNext) {
      _player.seekToNext();
    } else {
      showInfoToast('No next song');
    }
  }

  void clear() {
    stop();
    state = custom_player_state.PlayerState.reset();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}

final seekBarDataStreamProvider =
    StreamProvider.autoDispose<SeekBarData>((ref) {
  final player = ref.read(playerProvider.notifier).getPlayerInstance();
  return rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
      player.positionStream,
      player.durationStream,
      (position, duration) =>
          SeekBarData(position: position, duration: duration ?? Duration.zero));
});
