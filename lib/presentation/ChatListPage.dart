import 'package:app_chat/domain/entities/ChatList.dart';
import 'package:app_chat/domain/usecases/GetChatList.dart';
import 'package:app_chat/domain/usecases/GetChatUser.dart';
import 'package:app_chat/presentation/ChatMessagePage.dart';
import 'package:flutter/material.dart';

class ChatListPage extends StatefulWidget{
  late String username;
  late String id;
  ChatListPage({required this.username});

  @override
  _ChatListStatePage createState() => _ChatListStatePage();
}

class _ChatListStatePage extends State<ChatListPage>{
  late Future<List<String>> chatRooms;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chatRooms = GetUserChat().execute(widget.username).then(
        (userData){
          return userData.rooms;
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Rooms'),
      ),
      body: Container(
        height: 500,
        child: FutureBuilder(
          future: GetUserChat().execute(widget.username),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              String errorMessage = snapshot.error?.toString() ?? 'Unknown error';
              return Center(child: Text('error on ChatListPage ${errorMessage}'));
            } else if (snapshot.hasData) {
              final user = snapshot.data!;
              final roomsId = user.rooms; // untuk get data rooms
              return ListView.builder(
                itemCount: roomsId.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Set border radius for rounded corners
                      ),
                      child: FutureBuilder<ChatList>(
                        future: GetChatList().execute(roomsId[index]),
                        builder: (context, snapshot) {
                          // print('SNAPSHOT LIST PAGE : ${snapshot.data!}');
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            String errorMessage = snapshot.error?.toString() ?? 'Unknown Error';
                            print(snapshot.data);
                            print(errorMessage);
                            return Center(child: Text('error on ChatListPage ${errorMessage}'));
                          } else if (snapshot.hasData) {
                            print('Rooms ID didalam Future Builder : ${roomsId[index]}');
                            var _listUser = snapshot.data!.users;
                            var _listMessages = snapshot.data!.messages.last;
                            print('Menampilkan message : ${_listMessages}');
                            return Column(
                              children: [
                                ListTile(
                                  title: Text('${_listUser[1]}', style: TextStyle(fontWeight: FontWeight.bold),),
                                  subtitle: Text('${_listMessages.text}'),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ChatMessagePage(
                                          id: roomsId[index],
                                          username: _listUser[1],
                                        ),
                                      ),
                                    );
                                    // Code here will be executed after returning from ChatMessagePage
                                  },
                                ),
                              ],
                            );
                          }
                          // Add a default case to return an empty container or some other widget
                          return Container();
                        },
                      ),
                    ),
                  );
                },
              );
            }
            else{
              return Center(child: Text('Unknown Error'),);
            }
          },
        ),
      ),
    );
  }
}