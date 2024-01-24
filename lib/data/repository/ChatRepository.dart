import 'dart:convert';

import 'package:app_chat/data/datasource/ChatDataSource.dart';
import 'package:app_chat/domain/entities/User.dart';

class ChatRepository {
  var remoteChatDataSource = RemoteChatDataSource();

  Future<User> getUserData(String username) async {
    var jsonResponse = jsonDecode(await remoteChatDataSource.getUserData(username))['data'];
    User user = User.fromJson(jsonResponse as Map<String, dynamic>); //
    return user; // Added return statement
  }
}
