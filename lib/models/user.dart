class User {
  final String username;
  final String profileImage;

  User({required this.username, required this.profileImage});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      profileImage: json['profileImage'],
    );
  }
}