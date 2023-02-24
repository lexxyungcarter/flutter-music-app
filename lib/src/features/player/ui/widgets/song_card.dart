import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:marquee/marquee.dart';

import '../../../../utils/extensions.dart';
import '../../data/models/song.dart';
import '../../data/providers/player_provider.dart';
import '../screens/song_screen.dart';

class SongCard extends ConsumerStatefulWidget {
  const SongCard({Key? key, required this.song}) : super(key: key);

  final Song song;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SongCardState();
}

class _SongCardState extends ConsumerState<SongCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final playerState = ref.watch(playerProvider);

    return InkWell(
      onTap: () {
        // prevent replaying song if already playing
        if (playerState.currentSong != widget.song) {
          ref.read(playerProvider.notifier).playSong(widget.song);
        } else {
          // check if player is paused and unpause the song
          if (playerState.isPaused!) {
            ref.read(playerProvider.notifier).play();
          }
          // check if player is currently playing
          else if (!playerState.isPlaying!) {
            ref.read(playerProvider.notifier).playSong(widget.song);
          }
        }
        context.pushNamed(SongScreen.route);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: size.width * 0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(widget.song.coverUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: size.width * 0.37,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white.withOpacity(0.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          width: size.width * 0.37 - 70,
                          height: 40,
                          child: Marquee(
                            text: widget.song.description,
                            velocity: 20,
                            style: context.bodySmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 7,
                        child: Text(
                          widget.song.title,
                          style: context.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.play_circle,
                    color: Colors.deepPurple,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
