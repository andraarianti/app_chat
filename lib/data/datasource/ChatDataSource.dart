import 'package:http/http.dart' as http;

abstract class ChatDataSource{
  Future<String> getUserData(String username);
  Future<String> getChatList (String id);
}

class RemoteChatDataSource implements ChatDataSource {
  static const URL = 'http://127.0.0.1:8080';
  @override
  Future<String> getUserData(String username) async{ //get rooms sebenernya bukan user ya
    final response = await http.get(Uri.parse('${URL}/api/user/${username}'));
    if(response.statusCode == 200){
      // return jsonDecode(response.body);
      return response.body;
    } else{
      throw Exception('Failed...');
    }
  }

  @override
  Future<String> getChatList (String id) async { //untuk mengambik nama username yang ada di chatlist
    var response = await http.get(Uri.parse('${URL}/api/chat/${id}'));
    print(response.body);
    if(response.statusCode == 200){
      // return jsonDecode(response.body);
      return response.body;
    } else{
      throw Exception('Failed...');
    }
  }
}