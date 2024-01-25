import 'package:app_chat/data/repository/ChatRepository.dart';

import '../entities/User.dart';

class GetUserChat {
  var repository = ChatRepository();

  Future<User> execute(String username) async {
    try {
      return repository.getUserData(username);
    } catch (e) {
      print('[UseCases-ChatUser] Error fetching user data: $e');
      rethrow;
    }
  }
}