// import 'package:app_chat/domain/entities/User.dart';
// import 'package:app_chat/domain/entities/ChatMessage.dart';
//
// class ChatList {
//   final List<User> users;
//   final List<Message> messages;
//
//   ChatList({required this.users, required this.messages});
//
//   factory ChatList.fromJson(Map<String, dynamic> json) {
//     final List<User> users = (json['users'] as List)
//         .map((userJson) => User.fromJson(userJson))
//         .toList();
//
//     final List<Message> messages = (json['messages'] as List)
//         .map((messageJson) => Message.fromJson(messageJson))
//         .toList();
//
//     return ChatList(
//       users: users,
//       messages: messages,
//     );
//   }
// }

import 'package:app_chat/domain/entities/ChatMessage.dart';
import 'package:app_chat/domain/entities/User.dart';

class ChatRoom{
  String id;
  List<User> users;
  List<Message> messages;

  ChatRoom({required this.id, required this.users, required this.messages});

  factory ChatRoom.fromJson(Map<String, dynamic> json) {
    List<User> users = (json['users'] as List<dynamic>).map((userData) {
      return User.fromJson(userData);
    }).toList();

    List<Message> messages = (json['messages'] as List<dynamic>).map((messageData) {
      return Message.fromJson(messageData);
    }).toList();

    return ChatRoom(
      id: json['id'],
      users: users,
      messages: messages,
    );
  }
}