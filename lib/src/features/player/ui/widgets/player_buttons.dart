import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

import '../../data/providers/player_provider.dart';

class PlayerButtons extends ConsumerWidget {
  const PlayerButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<SequenceState?>(
          stream: ref
              .read(playerProvider.notifier)
              .getPlayerInstance()
              .sequenceStateStream,
          builder: (context, snapshot) {
            return IconButton(
              onPressed: () => ref.read(playerProvider.notifier).goPrevious(),
              icon: const Icon(
                Icons.skip_previous,
                size: 45,
                color: Colors.white,
              ),
            );
          },
        ),
        StreamBuilder<PlayerState>(
          stream: ref
              .read(playerProvider.notifier)
              .getPlayerInstance()
              .playerStateStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final playerState = snapshot.data;
              final processingState = (playerState!).processingState;

              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.pause_circle,
                    size: 75,
                    color: Colors.deepPurple.shade400,
                  ),
                );
              } else if (!ref
                  .read(playerProvider.notifier)
                  .getPlayerInstance()
                  .playing) {
                return IconButton(
                  onPressed: () => ref.read(playerProvider.notifier).play(),
                  icon: const Icon(
                    Icons.play_circle,
                    color: Colors.white,
                    size: 75,
                  ),
                );
              } else if (processingState != ProcessingState.completed) {
                return IconButton(
                  onPressed: () => ref.read(playerProvider.notifier).pause(),
                  icon: const Icon(
                    Icons.pause_circle,
                    color: Colors.white,
                    size: 75,
                  ),
                );
              } else {
                return IconButton(
                  onPressed: () => ref.read(playerProvider.notifier).replay(),
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
          stream: ref
              .read(playerProvider.notifier)
              .getPlayerInstance()
              .sequenceStateStream,
          builder: (context, snapshot) {
            return IconButton(
              onPressed: () => ref.read(playerProvider.notifier).goNext(),
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
