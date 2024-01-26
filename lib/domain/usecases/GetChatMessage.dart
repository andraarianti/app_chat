// import 'dart:convert';
// import 'package:app_chat/data/repository/ChatRepository.dart';
// import 'package:app_chat/domain/entities/ChatMessage.dart';
//
// import '../entities/ChatList.dart';
//
// class GetChatMessage {
//   var repository = ChatRepository();
//
//   Future<Message> execute(String id) async {
//     try {
//       return repository.getChatList(id);
//     } catch (e) {
//       print('[UseCases-ChatList] Error : $e');
//       rethrow;
//     }
//   }
// }