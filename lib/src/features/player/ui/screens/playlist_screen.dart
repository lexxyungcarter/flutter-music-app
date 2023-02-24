import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/app_styling.dart';
import '../../../../utils/extensions.dart';
import '../../data/models/selected_playlist_state.dart';
import '../../data/providers/playlist_provider.dart';
import '../../data/providers/song_provider.dart';
import '../widgets/appbar.dart';
import 'song_screen.dart';

class PlaylistScreen extends ConsumerStatefulWidget {
  const PlaylistScreen({Key? key}) : super(key: key);
  static const route = '/playlist';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends ConsumerState<PlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    final playlistState = ref.watch(selectedPlaylistProvider);
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        gradient: AppStyling.bgGradient,
      ),
      child: Scaffold(
        appBar: Appbar(
          title: 'Playlist',
          onIconPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          padding: AppStyling.pagePadding,
          child: playlistState.playlist == null
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    PlaylistInformation(
                      playlistState: playlistState,
                      size: size,
                    ),
                    AppStyling.spacer,
                    const PlayOrShuffleSwitch(),
                    PlaylistSongs(playlistState: playlistState),
                  ],
                ),
        ),
      ),
    );
  }
}

class PlaylistSongs extends ConsumerWidget {
  const PlaylistSongs({
    super.key,
    required this.playlistState,
  });

  final SelectedPlaylistState playlistState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: playlistState.playlist!.songs.length,
        itemBuilder: (context, index) {
          final item = playlistState.playlist!.songs[index];

          return ListTile(
            onTap: () {
              ref.read(selectedSongProvider.notifier).setSong(item);
              context.pushNamed(SongScreen.route);
            },
            leading: Text(
              '${index + 1}',
              style: context.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            title: Text(
              item.title,
              style: context.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${item.description} ॰ 02:45',
              style: context.bodySmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          );
        });
  }
}

class PlayOrShuffleSwitch extends ConsumerWidget {
  const PlayOrShuffleSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isShuffleOn = ref
        .watch(selectedPlaylistProvider.select((value) => value.isShuffleOn));

    return GestureDetector(
      onTap: () => ref.read(selectedPlaylistProvider.notifier).toggleShuffle(),
      child: Center(
        child: Container(
          height: 50,
          width: size.width - 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 150),
                left: !isShuffleOn! ? 0 : size.width * 0.45,
                child: Container(
                  height: 50,
                  width: size.width * 0.5 - 19,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'Play',
                            style: context.headlineSmall!.copyWith(
                              color: !isShuffleOn!
                                  ? Colors.white
                                  : Colors.deepPurple,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.play_circle,
                          color:
                              !isShuffleOn! ? Colors.white : Colors.deepPurple,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'Shuffle',
                            style: context.headlineSmall!.copyWith(
                              color: isShuffleOn!
                                  ? Colors.white
                                  : Colors.deepPurple,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.shuffle,
                          color:
                              isShuffleOn! ? Colors.white : Colors.deepPurple,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaylistInformation extends StatelessWidget {
  const PlaylistInformation({
    super.key,
    required this.playlistState,
    required this.size,
  });

  final SelectedPlaylistState playlistState;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            playlistState.playlist!.imageUrl,
            height: size.height * 0.3,
            width: size.height * 0.3,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          playlistState.playlist!.title,
          style: context.headlineMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
