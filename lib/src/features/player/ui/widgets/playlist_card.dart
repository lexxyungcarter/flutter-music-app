import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/extensions.dart';
import '../../../../utils/helpers.dart';
import '../../data/models/playlist.dart';
import '../../data/providers/playlist_provider.dart';
import '../screens/playlist_screen.dart';

class PlaylistCard extends ConsumerWidget {
  const PlaylistCard({Key? key, required this.playlist}) : super(key: key);

  final Playlist playlist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          ref.read(selectedPlaylistProvider.notifier).setPlaylist(playlist);
          context.pushNamed(PlaylistScreen.route);
        },
        child: Container(
          height: 75,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade800.withOpacity(0.6),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  playlist.imageUrl,
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      playlist.title,
                      style: context.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${playlist.songs.length} ${pluralize('songs', playlist.songs.length)}',
                      style: context.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.play_circle,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
