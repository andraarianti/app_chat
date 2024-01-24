import 'package:app_chat/domain/entities/User.dart';
import 'package:app_chat/domain/usecases/GetChatUser.dart';
import 'package:flutter/material.dart';

class ChatListPage extends StatefulWidget{
  late String username;
  ChatListPage({required this.username});

  @override
  _ChatListStatePage createState() => _ChatListStatePage();
}

class _ChatListStatePage extends State<ChatListPage>{
  late Future<Map<String, dynamic>> chatRooms;

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
        child: FutureBuilder<User>(
          future: GetUserChat().execute(widget.username),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError || snapshot.hasData) {
              String errorMessage =
                  snapshot.error?.toString() ?? 'Unknown error';
              return Center(child: Text('${errorMessage}'));
            } else {
              final user = snapshot.data!;
              final username = user.username;
              final roomIds = snapshot.data!;
              return FutureBuilder<Map<String, dynamic>>(
                future: chatRooms,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError || !snapshot.hasData) {
                    String errorMessage =
                        snapshot.error?.toString() ?? 'Unknown error';
                    return Center(child: Text('${errorMessage}'));
                  } else {
                    final roomIds = snapshot.data!;
                    return ListView.builder(
                      itemCount: roomIds.length,
                      itemBuilder: (context, index) {
                        // Use roomIds[index] to display information or fetch additional data if needed
                        return ListTile(
                          title: Text(roomIds[index]),
                          onTap: () {

                          },
                        );
                      },
                    );
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}