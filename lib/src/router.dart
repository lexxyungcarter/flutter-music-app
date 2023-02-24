import 'package:go_router/go_router.dart';

import 'features/home/ui/home_screen.dart';
import 'features/player/ui/screens/player_home_screen.dart';
import 'features/player/ui/screens/playlist_screen.dart';
import 'features/player/ui/screens/playlists_screen.dart';
import 'features/player/ui/screens/song_screen.dart';
import 'features/player/ui/screens/songs_screen.dart';
import 'features/settings/ui/settings_screen.dart';
import 'features/shared/ui/error_screen.dart';

final GoRouter router = GoRouter(
  errorBuilder: (context, state) => ErrorScreen(error: state.error),
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
      routes: [
        // GoRoute(
        //   path: 'onboarding',
        //   name: OnboardingScreen.route,
        //   builder: (context, state) => const OnboardingScreen(),
        // ),
        GoRoute(
          path: 'play',
          name: PlayerHomeScreen.route,
          builder: (context, state) => const PlayerHomeScreen(),
        ),
        GoRoute(
          path: 'song',
          name: SongScreen.route,
          builder: (context, state) => const SongScreen(),
        ),
        GoRoute(
          path: 'songs',
          name: SongsScreen.route,
          builder: (context, state) => const SongsScreen(),
        ),
        GoRoute(
          path: 'playlist',
          name: PlaylistScreen.route,
          builder: (context, state) => const PlaylistScreen(),
        ),
        GoRoute(
          path: 'playlists',
          name: PlaylistsScreen.route,
          builder: (context, state) => const PlaylistsScreen(),
        ),
        GoRoute(
          path: 'settings',
          name: SettingsScreen.route,
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    ),
  ],
);
