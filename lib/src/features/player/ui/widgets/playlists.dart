import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/app_styling.dart';
import '../../data/providers/playlist_provider.dart';
import '../screens/playlists_screen.dart';
import 'playlist_card.dart';
import 'section_header.dart';

class Playlists extends ConsumerStatefulWidget {
  const Playlists({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlaylistsState();
}

class _PlaylistsState extends ConsumerState<Playlists> {
  @override
  Widget build(BuildContext context) {
    final playlists = ref.watch(playlistProvider);

    return Column(
      children: [
        Padding(
          padding: AppStyling.pageSidePadding,
          child: SectionHeader(
            title: 'Playlists',
            action: 'View More',
            onActionPressed: () => context.pushNamed(PlaylistsScreen.route),
          ),
        ),
        Padding(
          padding: AppStyling.pagePadding,
          child: ListView.builder(
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(), // since we are using a SingleChildScrollView
            itemCount: playlists.length,
            itemBuilder: (context, index) =>
                PlaylistCard(playlist: playlists[index]),
          ),
        ),
      ],
    );
  }
}
