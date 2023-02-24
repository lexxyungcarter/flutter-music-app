import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../utils/app_styling.dart';
import '../../../../utils/extensions.dart';
import '../../data/models/seek_bar_data.dart';
import '../../data/models/song.dart';
import 'player_buttons.dart';
import 'seekbar.dart';

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({
    super.key,
    required this.seekBarDataStream,
    required this.player,
    required this.song,
  });

  final Stream<SeekBarData> seekBarDataStream;
  final AudioPlayer player;
  final Song song;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            song.title,
            style: context.headlineSmall!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            song.description,
            style: context.bodySmall!.copyWith(
              color: Colors.white,
            ),
          ),
          AppStyling.spacer,
          StreamBuilder<SeekBarData>(
            stream: seekBarDataStream,
            builder: (context, snapshot) {
              final positionData = snapshot.data;

              return Seekbar(
                position: positionData?.position ?? Duration.zero,
                duration: positionData?.duration ?? Duration.zero,
                onChanged: player.seek,
              );
            },
          ),
          PlayerButtons(player: player),
          AppStyling.spacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  size: 35,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.cloud_download,
                  size: 35,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
