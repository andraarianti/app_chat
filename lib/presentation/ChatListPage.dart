import 'package:app_chat/domain/entities/User.dart';
import 'package:app_chat/domain/usecases/GetChatList.dart';
import 'package:app_chat/domain/usecases/GetChatUser.dart';
import 'package:flutter/material.dart';

class ChatListPage extends StatefulWidget{
  late String username;
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
        child: FutureBuilder<User>(
          future: GetUserChat().execute(widget.username),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              String errorMessage = snapshot.error?.toString() ?? 'Unknown error';
              return Center(child: Text('error on ChatListPage ${errorMessage}'));
            } else if (snapshot.hasData) {
              final user = snapshot.data!;
              final rooms = user.rooms; // untuk get data rooms
              return ListView.builder(
                  itemCount: rooms.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(rooms[index]),
                    );
                  }
              );
              // return (Text(user.rooms[0]));
              // return ListView.builder(
              //   itemCount: user.rooms.length,
              //   itemBuilder: (context, index){
              //     final roomId = user.rooms[index];
              //     return FutureBuilder(
              //         future: GetChatList().execute(roomId),
              //         builder: (context, chatRoomSnapshot) {
              //           if (chatRoomSnapshot.connectionState == ConnectionState.waiting){
              //             return ListTile(
              //               title: Text(roomId),
              //               subtitle: Text('Loading...'),
              //               onTap: () {
              //                 // Handle onTap as needed
              //               },
              //             );
              //           } else if (chatRoomSnapshot.hasError) {
              //             print('${chatRoomSnapshot}');
              //             print('Error loading chat room data for room $roomId: ${chatRoomSnapshot.error}');
              //             return ListTile(
              //               title: Text(roomId),
              //               subtitle: Text('Error loading chat room data'),
              //               onTap: () {
              //                 // Handle onTap as needed
              //               },
              //             );
              //           } else if (!chatRoomSnapshot.hasData) {
              //             print('No data available for chat room $roomId');
              //             return ListTile(
              //               title: Text(roomId),
              //               subtitle: Text('No data available for chat room'),
              //               onTap: () {
              //                 // Handle onTap as needed
              //               },
              //             );
              //           } else {
              //             final chatRoom = chatRoomSnapshot.data!;
              //             final opponentUsers = chatRoom.users.where((user) => user.username != widget.username).toList();
              //
              //             return ListTile(
              //               title: Text(roomId),
              //               subtitle: Text('Opponents: ${opponentUsers.map((user) => user.username).join(', ')}'),
              //               onTap: () {
              //                 // Handle onTap as needed
              //               },
              //             );
              //           }
              //         }
              //     );
              //   },
              // );
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