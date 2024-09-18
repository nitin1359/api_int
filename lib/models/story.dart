class Story {
  final String id;
  final String username;
  final String imageUrl;

  Story({required this.id, required this.username, required this.imageUrl});

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['id'],
      username: json['username'],
      imageUrl: json['imageUrl'],
    );
  }
}