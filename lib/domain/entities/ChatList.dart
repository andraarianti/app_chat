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

class ChatList{
  List<String> users;
  List<Message> messages;

  ChatList({required this.users, required this.messages});

  factory ChatList.fromJson(Map<String, dynamic> json) {
    print('Entities Chatlist : $json');
    print('Coba username : ${json['users'][0]}');
    print('Coba messages : ${json['messages'][0]}');

    var users = <String>[];
    for (var i = 0; i < json['users'].length; i++){
      users.add(json['users'][i]);
      print('User $i : ${json['users'][i]}');
    }

    var messages = <Message>[];
    for (var i = 0; i < json['messages'].length; i++){
      print('Message $i : ${json['messages'][i]}');
      messages.add(Message.fromJson(json['messages'][i]));
      print('Message $i : ${json['messages'][i]}');
    }
    
    return ChatList(
      users: users,
      messages: messages,
    );
  }
}