import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/song.dart';

final songsProvider = Provider<List<Song>>(
  (ref) => [
    Song(
      title: 'Quantum',
      description: 'Song by Brooks and Martin Garrix',
      url: 'assets/music/martin-garrix-and-brooks-quantum.mp3',
      coverUrl:
          'https://i1.sndcdn.com/artworks-03C94zsQyslbWhdf-F3tGMw-t500x500.jpg',
    ),
    Song(
      title: 'Find You',
      description: 'Song by Justin Mylo and Martin Garrix',
      url:
          'assets/music/martin-garrix-and-justin-mylo-feat-dewain-whitmore-find-you.mp3',
      coverUrl:
          'https://i1.sndcdn.com/artworks-Vw7C0bZy8FK3vBhu-OikP5A-t500x500.jpg',
    ),
    Song(
      title: 'Follow',
      description: 'Song by Martin Garrix and Zedd',
      url: 'assets/music/martin-garrix-and-zedd-follow.mp3',
      coverUrl:
          'https://i1.sndcdn.com/artworks-yHWo687QxW32z26x-n4S1iw-t500x500.jpg',
    ),
  ],
);
