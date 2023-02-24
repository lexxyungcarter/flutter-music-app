import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/app_styling.dart';
import '../../data/providers/player_provider.dart';
import '../widgets/music_player.dart';

class SongScreen extends ConsumerStatefulWidget {
  const SongScreen({Key? key}) : super(key: key);
  static const route = '/song';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SongScreenState();
}

class _SongScreenState extends ConsumerState<SongScreen> {
  @override
  Widget build(BuildContext context) {
    final currentSong =
        ref.watch(playerProvider.select((value) => value.currentSong));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          currentSong != null
              ? Image.network(
                  currentSong.coverUrl,
                  fit: BoxFit.cover,
                )
              : Container(),
          const _BackgroundFilter(),
          currentSong != null ? const MusicPlayer() : Container(),
        ],
      ),
    );
  }
}

class _BackgroundFilter extends StatelessWidget {
  const _BackgroundFilter();

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.dstOut,
      shaderCallback: (rect) {
        return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0),
            ],
            stops: const [
              0,
              0.4,
              0.6,
            ]).createShader(rect);
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: AppStyling.bgGradientSong,
        ),
      ),
    );
  }
}
