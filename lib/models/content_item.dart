import 'package:api_int/models/user.dart';

class ContentItem {
  final String id;
  final String imageUrl;
  final String title;
  final String description;
  final User user;
  final int likes;
  final int comments;

  ContentItem({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.user,
    required this.likes,
    required this.comments,
  });

  factory ContentItem.fromJson(Map<String, dynamic> json) {
    return ContentItem(
      id: json['id'],
      imageUrl: json['imageUrl'],
      title: json['title'],
      description: json['description'],
      user: User.fromJson(json['user']),
      likes: json['likes'],
      comments: json['comments'],
    );
  }
}