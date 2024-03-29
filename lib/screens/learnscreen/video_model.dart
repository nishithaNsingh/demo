class Video {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String channelTitle;
  int? viewCount;

  Video({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.channelTitle,

  });

  factory Video.fromMap(Map<String, dynamic> snippet) {
    return Video(
      id: snippet['resourceId']['videoId'],
      title: snippet['title'],
      thumbnailUrl: snippet['thumbnails']['high']['url'],
      channelTitle: snippet['channelTitle'],
    );
  }

  // get viewCount => null;
}