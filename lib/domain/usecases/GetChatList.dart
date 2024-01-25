
import 'dart:convert';
import 'package:app_chat/data/repository/ChatRepository.dart';
import 'package:http/http.dart' as http;

import '../entities/ChatRoom.dart';


final URL = 'http://127.0.0.1:8080';

class GetChatList {
  late String username;
  late final ChatRepository repository;

  Future<ChatRoom> execute(String id) async {
    try {
      return repository.getChatData(id);
    } catch (e) {
      print('[UseCases-ChatList] Error fetching user data: $e');
      rethrow;
    }
  }
}