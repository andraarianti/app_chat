import 'package:http/http.dart' as http;

abstract class ChaDataSource{
  Future<String> getUserData(String username);
}

class RemoteChatDataSource implements ChaDataSource {
  static const URL = 'http://127.0.0.1:8080';
  @override
  Future<String> getUserData(String username) async{
    final response = await http.get(Uri.parse('${URL}/api/room/${username}'));
    if(response.statusCode == 200){
      return response.body;
    } else{
      throw Exception('Failed...');
    }
  }
}