import 'package:app_chat/domain/entities/ChatList.dart';
import 'package:app_chat/domain/entities/ChatMessage.dart';
import 'package:app_chat/domain/usecases/CreateMessage.dart';
import 'package:app_chat/domain/usecases/GetChatList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class ChatMessagePage extends StatefulWidget {
  final String id;
  final String username;

  ChatMessagePage({required this.id, required this.username});

  @override
  _ChatMessagePageState createState() => _ChatMessagePageState();
}

class _ChatMessagePageState extends State<ChatMessagePage> {
  TextEditingController _messageController = TextEditingController();

  late Future<ChatList> chatMessage;
  late String _senderUsername;

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
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
            height: 80,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "${widget.username}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: Column(
                children: [
                  FutureBuilder<ChatList>(
                    future: GetChatList().execute(widget.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        String errorMessage =
                            snapshot.error?.toString() ?? 'Unknown error';
                        return Center(
                            child:
                                Text('error on ChatListPage ${errorMessage}'));
                      } else if (snapshot.hasData) {
                        // Add a default return statement when snapshot.hasData is true but no specific widget to return.
                        var data = snapshot.data!;
                        var message = data.messages;
                        return Expanded(
                          child: ListView.builder(
                              itemCount: message.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                var _listMessages = message[index].text;
                                var _listUsername = message[index].username;
                                _senderUsername = message[0].username;

                                return Container(
                                  padding: EdgeInsets.only(
                                      left: 14, right: 14, top: 10, bottom: 10),
                                  child: Align(
                                    alignment: (_listUsername != _senderUsername
                                        ? Alignment.topLeft
                                        : Alignment.topRight),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: (_listUsername != _senderUsername
                                            ? Colors.grey.shade200
                                            : Colors.purple[100]),
                                      ),
                                      padding: EdgeInsets.all(16),
                                      child: Text(
                                        _listMessages,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        );
                      } else {
                        return Center(
                          child: Text('Unknown Error'),
                        );
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
                  FloatingActionButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 24,
                    ),
                    backgroundColor: Colors.purpleAccent,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Type a message ....',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      sendMessage(_messageController.text, _senderUsername);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 24,
                    ),
                    backgroundColor: Colors.purpleAccent,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage(String _inputMessage, _senderUsername) async {
    String id = widget.id;
    print('ID ROOM : ${id}');
    String text = _messageController.text;
    print('MESSAGE : ${_messageController}');
    String username = _senderUsername;
    print('USERNAME : ${username}');
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    print('TIMESTAMP : ${timestamp}');

    final sendMessageUseCase = CreateMessage();

    Message newMessage = Message(
      id: id,
      username: username,
      text: text,
      timestamp: timestamp,
    );

    try {
      await sendMessageUseCase.execute(newMessage);
      _messageController.clear();
      // Update chatRoomData after sending a new message
      setState(() {
        chatMessage = GetChatList().execute(id);
      });
    } catch (e) {
      // Handle exception
      print('Error sending message: $e');
    }
  }
}
