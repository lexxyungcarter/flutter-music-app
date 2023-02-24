class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  String get fullTitle => '$title - $description ॰ ';

  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
  });
}
