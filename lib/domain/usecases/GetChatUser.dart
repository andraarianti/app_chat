import 'package:app_chat/data/repository/ChatRepository.dart';

import '../entities/User.dart';

class GetUserChat{
  var repository = ChatRepository();

  Future<User> execute(String username) async {
    return repository.getUserData(username);
  }
}