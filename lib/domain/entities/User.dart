class User {
  String username;
  List<String> rooms;

  User({required this.username, required this.rooms});

  factory User.fromJson(Map<String, dynamic> json) {
    print('From JSON : $json');
    print(json['username']);
    print(List<String>.from(json['rooms']));
    return User(
        username: json['username'] ?? '',
        rooms: List<String>.from(json['rooms']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username' : this.username,
      'rooms' : this.rooms,
    };
  }
}