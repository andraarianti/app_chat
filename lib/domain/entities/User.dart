class User {
  String username;
  Map<String, dynamic> rooms;

  User({required this.username, required this.rooms});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        username: json['username'] ?? '',
        rooms: Map<String, dynamic>.from(json['rooms'] ?? []),
    );
  }
}