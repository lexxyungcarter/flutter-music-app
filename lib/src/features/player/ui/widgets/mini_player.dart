import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/src/utils/extensions.dart';

class MiniPlayer extends ConsumerStatefulWidget {
  const MiniPlayer({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends ConsumerState<MiniPlayer> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
