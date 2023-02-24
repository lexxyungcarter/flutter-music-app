import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

import '../../../../utils/app_styling.dart';
import '../../data/models/seek_bar_data.dart';
import '../../data/providers/song_provider.dart';
import '../widgets/music_player.dart';

class SongScreen extends ConsumerStatefulWidget {
  const SongScreen({Key? key}) : super(key: key);
  static const route = '/song';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SongScreenState();
}

class _SongScreenState extends ConsumerState<SongScreen>
    with WidgetsBindingObserver {
  final _player = AudioPlayer();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      final songState = ref.watch(selectedSongProvider);

      if (songState.song != null) {
        _player.setAudioSource(
          ConcatenatingAudioSource(
            children: [
              AudioSource.uri(Uri.parse('asset:///${songState.song!.url}')),
            ],
          ),
        );

        _player.play();
      }
    });
  }

  @override
  void dispose() {
    // ambiguate(WidgetsBinding.instance)!.removeObserver(this);
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.
    // _player.dispose();
    super.dispose();
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          _player.positionStream,
          _player.durationStream,
          (position, duration) => SeekBarData(
              position: position, duration: duration ?? Duration.zero));

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      _player.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final songState = ref.watch(selectedSongProvider);

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
          songState.song != null
              ? Image.network(
                  songState.song?.coverUrl ?? '-',
                  fit: BoxFit.cover,
                )
              : Container(),
          const _BackgroundFilter(),
          songState.song != null
              ? MusicPlayer(
                  song: songState.song!,
                  seekBarDataStream: _seekBarDataStream,
                  player: _player,
                )
              : Container(),
        ],
      ),
    );
  }
}

class _BackgroundFilter extends StatelessWidget {
  const _BackgroundFilter({
    super.key,
  });

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
