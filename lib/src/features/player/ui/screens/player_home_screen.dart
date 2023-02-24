import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/app_styling.dart';
import '../widgets/appbar.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/discover_music.dart';
import '../widgets/playlists.dart';
import '../widgets/trending.dart';

class PlayerHomeScreen extends ConsumerStatefulWidget {
  const PlayerHomeScreen({Key? key}) : super(key: key);
  static const route = '/player-home';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PlayerHomeScreenState();
}

class _PlayerHomeScreenState extends ConsumerState<PlayerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppStyling.bgGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const Appbar(
          icon: Icons.grid_view_rounded,
          showAvatar: true,
        ),
        bottomNavigationBar: const BottomNavbar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              DiscoverMusic(),
              AppStyling.spacer,
              Trending(),
              AppStyling.spacer,
              Playlists(),
              AppStyling.spacerBottom,
            ],
          ),
        ),
      ),
    );
  }
}
