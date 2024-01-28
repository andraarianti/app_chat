import 'dart:convert';

import '../../domain/entities/ChatList.dart';
import '../../domain/entities/ChatMessage.dart';
import '../../domain/entities/User.dart';
import '../datasource/ChatDataSource.dart';

class ChatRepository {
  var remoteChatDataSource = RemoteChatDataSource();

  Future<User> getUserData(String username) async {
    var jsonArray = jsonDecode(await remoteChatDataSource.getUserData(username))['data'];
    User user = User.fromJson(jsonArray);
    return user;
  }

  Future<ChatList> getChatList(String id) async {
    var jsonArray = jsonDecode(await remoteChatDataSource.getChatList(id))['data'];
    print('Server Response : $jsonArray');
    ChatList chatList = ChatList.fromJson(jsonArray);
    print('GET JSON [REPOSITORY] : ${chatList}');
    return chatList;
  }

  Future<bool> createMessage(Message message) async {
    try {
      if (message.timestamp is int) {
        message.timestamp = message.timestamp.toString();
      }

      var response = await remoteChatDataSource.createMessage(message.toJson());
      // You can do additional processing with the response if needed
      print('PRINT HASIL CREATE : $response');
      return true; // Assuming success if no exceptions were thrown
    } catch (e) {
      print('[REPOSITORY] Error Create Message : $e');
      return false;
    }
  }

}
