import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/app_styling.dart';
import '../../../../utils/extensions.dart';
import '../../data/providers/player_provider.dart';
import 'player_buttons.dart';
import 'seekbar.dart';

class MusicPlayer extends ConsumerWidget {
  const MusicPlayer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSong =
        ref.watch(playerProvider.select((value) => value.currentSong));
    final seekBarDataStream = ref.watch(seekBarDataStreamProvider);

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
            currentSong!.title,
            style: context.headlineSmall!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            currentSong!.description,
            style: context.bodySmall!.copyWith(
              color: Colors.white,
            ),
          ),
          AppStyling.spacer,
          seekBarDataStream.when(
            data: (positionData) => Seekbar(
              position: positionData.position,
              duration: positionData.duration,
              onChanged: ref.read(playerProvider.notifier).seek,
            ),
            loading: () => const Center(child: LinearProgressIndicator()),
            error: (error, stackTrace) => Text(error.toString()),
          ),

          // StreamBuilder<SeekBarData>(
          //   stream: seekBarDataStream,
          //   builder: (context, snapshot) {
          //     final positionData = snapshot.data;

          //     return Seekbar(
          //       position: positionData?.position ?? Duration.zero,
          //       duration: positionData?.duration ?? Duration.zero,
          //       onChanged:
          //           ref.read(playerProvider.notifier).getPlayerInstance().seek,
          //     );
          //   },
          // ),
          const PlayerButtons(),
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
