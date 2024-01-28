class Message {
  String id;
  String username;
  String text;
  String timestamp;

  Message({
    required this.id,
    required this.username,
    required this.text,
    required this.timestamp,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] ?? '', // Add this line to handle null values
      username: json['username'] ?? '', // Add this line to handle null values
      text: json['text'] ?? '',
      timestamp: json['timestamp']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'text': text,
      'timestamp': timestamp,
    };
  }
}