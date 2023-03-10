import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/app_styling.dart';
import '../../data/providers/songs_provider.dart';
import '../screens/songs_screen.dart';
import 'section_header.dart';
import 'song_card.dart';

class Trending extends ConsumerStatefulWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TrendingState();
}

class _TrendingState extends ConsumerState<Trending> {
  @override
  Widget build(BuildContext context) {
    final songs = ref.watch(songsProvider);
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: AppStyling.pageSidePadding,
          child: SectionHeader(
            title: 'Trending Music',
            action: 'View More',
            onActionPressed: () {
              // TODO: set trending flag on provider
              context.pushNamed(SongsScreen.route);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 20, bottom: 20),
          child: SizedBox(
            height: size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: (context, index) => SongCard(song: songs[index]),
            ),
          ),
        ),
      ],
    );
  }
}
