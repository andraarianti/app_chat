
import 'package:app_chat/domain/entities/ChatList.dart';
import 'package:app_chat/domain/usecases/GetChatList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../domain/usecases/GetChatUser.dart';

class ChatMessagePage extends StatefulWidget{
  final String id;
  final String username;

  ChatMessagePage({required this.id, required this.username});

  @override
  _ChatMessagePageState createState() => _ChatMessagePageState();
}

class _ChatMessagePageState extends State<ChatMessagePage>{
  TextEditingController _messageController = TextEditingController();

  late Future<ChatList> chatMessage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chatMessage = GetChatList().execute(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room : ${widget.id}'),
      ),
      body: Column(
        children: [
            Expanded(
              child: Container(
                  child: Column(
                    children: [
                      FutureBuilder<ChatList>(
                        future: GetChatList().execute(widget.id),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            String errorMessage = snapshot.error?.toString() ?? 'Unknown error';
                            return Center(child: Text('error on ChatListPage ${errorMessage}'));
                          } else if (snapshot.hasData) {
                            // Add a default return statement when snapshot.hasData is true but no specific widget to return.
                            var data = snapshot.data!;
                            var user = data.users;
                            var message = data.messages;
                            return Expanded(
                              child: ListView.builder
                                (
                                  itemCount: message.length,
                                  itemBuilder: (context, index){
                                    var _listMessages = message[index].text;
                                    var _listUsername = message[index].username;
                                    return ListTile(
                                      title: Text(_listUsername),
                                      subtitle: Text(_listMessages),
                                    );
                                  }
                                ),
                            );
                          } else {
                            return Center(child: Text('Unknown Error'),);
                          }
                        },
                      ),
                    ],
                  ),
                ),
            ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                          hintText: 'Type a message ....'
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.send)
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}