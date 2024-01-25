import 'dart:convert';

import '../../domain/entities/ChatRoom.dart';
import '../../domain/entities/User.dart';
import '../datasource/ChatDataSource.dart';

class ChatRepository {
  var remoteChatDataSource = RemoteChatDataSource();

  Future<User> getUserData(String username) async {
    var jsonArray = jsonDecode(await remoteChatDataSource.getUserData(username))['data'];
    User user = User.fromJson(jsonArray);
    print('${jsonArray}');
    return user;
  }

  Future<ChatRoom> getChatData(String id) async {
    var jsonArray = jsonDecode(await remoteChatDataSource.getChatData(id))['data'];
    ChatRoom chatRoom = ChatRoom.fromJson(jsonArray);
    print('${jsonArray}');
    return chatRoom;
  }
}
