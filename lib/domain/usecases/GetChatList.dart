import 'package:app_chat/data/repository/ChatRepository.dart';

import '../entities/ChatList.dart';


class GetChatList {
  var repository = ChatRepository();

  Future<ChatList> execute(String id) async {
    try {
      return repository.getChatList(id);
    } catch (e) {
      print('[UseCases-ChatList] Error : $e');
      rethrow;
    }
  }
}