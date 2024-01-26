import 'dart:convert';

import '../../domain/entities/ChatList.dart';
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
}
