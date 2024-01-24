// import 'package:app_chat/domain/entities/User.dart';
// import 'package:app_chat/domain/entities/Message.dart';
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