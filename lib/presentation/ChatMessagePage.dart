
import 'package:app_chat/domain/entities/ChatList.dart';
import 'package:app_chat/domain/usecases/GetChatList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Column(
                    children: [
                      // FutureBuilder<>(future: future, builder: builder)
                    ],
                  ),
                  Row(
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}