
import 'dart:convert';
import 'package:app_chat/data/repository/ChatRepository.dart';
import 'package:http/http.dart' as http;


final URL = 'http://127.0.0.1:8080';

class GetChatList {
  late String username;
  late final ChatRepository repository;

  // GetChatList() {
  //   repository = ChatRepository(apiSource: ChatDataSource()., username: '${username}');
  // }
  // Future<List<ChatList>> getChatList() async{
  //   var response = await http.get(Uri.parse('${URL}/api/room/${username}'));
  //   var jsonArray = jsonDecode(response.body)['data'];
  //   var listChat = <ChatList>[];
  //   for(var i = 0; i < jsonArray.length; i++){
  //     listChat.add(ChatList.fromJson(jsonArray[i]));
  //   }
  //   return listChat;
  // }
}