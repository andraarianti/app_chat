class User {
  String username;
  List<String> rooms;

  User({required this.username, required this.rooms});

  factory User.fromJson(Map<String, dynamic> json) {
    print('From JSON ENTITIES : $json');
    print(json['username']);
    print(List<String>.from(json['rooms']));
    return User(
      username: json['username'] ?? '', // Replace '' with a default value if needed
      rooms: List<String>.from(json['rooms'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username' : this.username,
      'rooms' : this.rooms,
    };
  }
}