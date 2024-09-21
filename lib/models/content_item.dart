class ContentItem {
  final String id;
  final String thumbnail;
  final String title;
  final String content;

  ContentItem({required this.id, required this.thumbnail, required this.title, required this.content});

  factory ContentItem.fromJson(Map<String, dynamic> json) {
    return ContentItem(
      id: json['id'],
      thumbnail: json['thumbnail'],
      title: json['title'],
      content: json['content'],
    );
  }
}