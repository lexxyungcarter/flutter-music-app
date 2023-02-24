import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../utils/app_styling.dart';
import '../widgets/appbar.dart';
import '../widgets/mini_player.dart';

class PlaylistsScreen extends StatefulHookConsumerWidget {
  const PlaylistsScreen({Key? key}) : super(key: key);
  static const route = '/playlists';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PlaylistsScreenState();
}

class _PlaylistsScreenState extends ConsumerState<PlaylistsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppStyling.bgGradient,
      ),
      child: Scaffold(
        appBar: Appbar(
          title: 'Playlists',
          onIconPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        bottomNavigationBar: const MiniPlayer(),
        body: SingleChildScrollView(
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }
}
