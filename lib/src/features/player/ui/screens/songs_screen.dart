import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../utils/app_styling.dart';
import '../widgets/appbar.dart';

class SongsScreen extends StatefulHookConsumerWidget {
  const SongsScreen({Key? key}) : super(key: key);
  static const route = '/songs';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SongsScreenState();
}

class _SongsScreenState extends ConsumerState<SongsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppStyling.bgGradient,
      ),
      child: Scaffold(
        appBar: Appbar(
          title: 'Songs',
          onIconPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: const [
              Text('Songs Page'),
            ],
          ),
        ),
      ),
    );
  }
}
