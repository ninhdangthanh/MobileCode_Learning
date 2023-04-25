import 'package:flutter/material.dart';

import 'main.dart';
import 'model/message_model.dart';
import 'model/user_model.dart';

class ChatsScreen extends StatefulWidget {
  User? user;
  static const String routeName = 'ChatsScreen';

  ChatsScreen({this.user});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  _buildMessage(Message message, bool isMe) {
    return Container(
      margin: isMe
          ? const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 80.0,
            )
          : const EdgeInsets.only(
              top: 8.0,
              left: 8.0,
              right: 80.0,
            ),
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      decoration: BoxDecoration(
        color: isMe
            ? backgroundColor.withOpacity(0.5)
            : backgroundColor.withOpacity(0.3),
        borderRadius: isMe
            ? const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0))
            : const BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.time,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white24,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            message.text,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  _buildSendMessage() {
    return Container(
      height: 70,
      color: containerBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
              color: backgroundColor, borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.photo_library),
                color: Colors.white54,
                iconSize: 25,
                onPressed: () {},
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Send your Message',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white24,
                        letterSpacing: 1.2,
                      )),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                color: Colors.white54,
                iconSize: 25,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user1 = ModalRoute.of(context)?.settings.arguments as User;
    // print(user1);
    widget.user = user1;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          widget.user!.name,
          style: const TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 40.0,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              decoration: BoxDecoration(
                color: containerBackground,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
              ),
              child: ListView.builder(
                reverse: true,
                padding: EdgeInsets.only(top: 20),
                itemCount: chats.length,
                itemBuilder: (BuildContext context, int index) {
                  final Message message = messages[index];
                  final bool isMe = message.sender.id == currentUser.id;
                  return _buildMessage(message, isMe);
                },
              ),
            ),
          )),
          _buildSendMessage(),
        ],
      ),
    );
  }
}
