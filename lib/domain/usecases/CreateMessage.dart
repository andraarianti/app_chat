import 'package:app_chat/data/repository/ChatRepository.dart';
import 'package:app_chat/domain/entities/ChatMessage.dart';

class CreateMessage {
  var repository = ChatRepository();

  Future<bool> execute(Message message) async {
    return repository.createMessage(message);
  }
}