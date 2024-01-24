
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget{
  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom>{
  TextEditingController _chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Room'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Column(
                  children: [
                    Card(
                      child: Text('Nama', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Expanded(
                    child: TextField(
                      controller: _chatController,
                      decoration: InputDecoration(
                        hintText: 'Type a message ....'
                      ),
                    ),
                ),
                IconButton(
                    onPressed: (){

                    },
                    icon: Icon(Icons.add)
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}