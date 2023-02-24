import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:marquee/marquee.dart';

import '../../../../utils/extensions.dart';
import '../../data/providers/player_provider.dart';
import '../screens/song_screen.dart';

class MiniPlayer extends ConsumerStatefulWidget {
  const MiniPlayer({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends ConsumerState<MiniPlayer> {
  @override
  Widget build(BuildContext context) {
    final playerState = ref.watch(playerProvider);

    return playerState.currentSong == null
        ? Container()
        : Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade800,
            ),
            padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => context.pushNamed(SongScreen.route),
                    child: SizedBox(
                      height: 20,
                      child: Marquee(
                        text: playerState.currentSong!.fullTitle,
                        velocity: 20,
                        style: context.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple.shade100,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () =>
                          ref.read(playerProvider.notifier).togglePlayer(),
                      icon: Icon(
                        playerState.isCompleted!
                            ? Icons.replay_circle_filled_outlined
                            : playerState.isPausedOrStopped
                                ? Icons.play_circle
                                : Icons.pause_circle_filled,
                        color: Colors.deepPurple.shade100,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () =>
                          ref.read(playerProvider.notifier).goNext(),
                      icon: Icon(
                        Icons.skip_next,
                        color: Colors.deepPurple.shade100,
                        size: 25,
                      ),
                    ),
                    IconButton(
                      onPressed: () =>
                          ref.read(playerProvider.notifier).clear(),
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.deepPurple.shade100,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
