import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../utils/helpers.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({
    super.key,
    required AudioPlayer player,
  }) : _player = player;

  final AudioPlayer _player;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<SequenceState?>(
          stream: _player.sequenceStateStream,
          builder: (context, snapshot) {
            return IconButton(
              onPressed: () {
                if (_player.hasPrevious) {
                  _player.seekToPrevious();
                } else {
                  showInfoToast('No previous song');
                }
              },
              icon: const Icon(
                Icons.skip_previous,
                size: 45,
                color: Colors.white,
              ),
            );
          },
        ),
        StreamBuilder<PlayerState>(
          stream: _player.playerStateStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final playerState = snapshot.data;
              final processingState = (playerState!).processingState;

              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.cached_outlined,
                    size: 75,
                    color: Colors.deepPurple.shade400,
                  ),
                );
              } else if (!_player.playing) {
                return IconButton(
                  onPressed: _player.play,
                  icon: const Icon(
                    Icons.play_circle,
                    color: Colors.white,
                    size: 75,
                  ),
                );
              } else if (processingState != ProcessingState.completed) {
                return IconButton(
                  onPressed: _player.pause,
                  icon: const Icon(
                    Icons.pause_circle,
                    color: Colors.white,
                    size: 75,
                  ),
                );
              } else {
                return IconButton(
                  onPressed: () => _player.seek(
                    Duration.zero,
                    index: _player.effectiveIndices!.first,
                  ),
                  icon: const Icon(
                    Icons.replay_circle_filled_outlined,
                    color: Colors.white,
                    size: 75,
                  ),
                );
              }
            }

            return Container(
              height: 75,
              width: 75,
              padding: const EdgeInsets.all(20),
              child: const CircularProgressIndicator(),
            );
          },
        ),
        StreamBuilder<SequenceState?>(
          stream: _player.sequenceStateStream,
          builder: (context, snapshot) {
            return IconButton(
              onPressed: () {
                if (_player.hasNext) {
                  _player.seekToNext();
                } else {
                  showInfoToast('No next song');
                }
              },
              icon: const Icon(
                Icons.skip_next,
                size: 45,
                color: Colors.white,
              ),
            );
          },
        ),
      ],
    );
  }
}
