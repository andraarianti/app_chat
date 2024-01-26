class Message {
  String username;
  String text;
  String timestamp;

  Message({required this.username, required this.text, required this.timestamp});

  factory Message.fromJson(Map<String, dynamic> json) {
    print('Entities Messages : $json}');
    return Message(
        username: json['username'],
        text: json['text'],
        timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    print('Message Entities JSON : $username, $text, $timestamp');
    return {
      'username': username,
      'text': text,
      'timestamp': timestamp,
    };
  }
}

