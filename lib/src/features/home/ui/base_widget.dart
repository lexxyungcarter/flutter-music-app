import 'package:flutter/material.dart';

import '../../player/ui/widgets/mini_player.dart';

class BaseWidget extends StatelessWidget {
  final Widget? child;

  const BaseWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: child ?? Container()),
          const MiniPlayer(),
        ],
      ),
    );
  }
}
