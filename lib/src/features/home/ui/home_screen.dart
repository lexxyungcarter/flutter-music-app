import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../player/ui/screens/player_home_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const route = '/home';

// udpate this accordingly
  final bool _isLoggedIn = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _isLoggedIn
          ? const PlayerHomeScreen()
          : const Center(
              child: Text('Login to continue'),
            ),
    );
  }
}
