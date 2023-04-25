import 'package:flutter/material.dart';

import '../chat_screen.dart';
import '../main.dart';
import '../model/message_model.dart';

class MenuChate extends StatefulWidget {
  const MenuChate({Key? key}) : super(key: key);

  @override
  State<MenuChate> createState() => _MenuChateState();
}

class _MenuChateState extends State<MenuChate> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.2),
      ),
      child: ListView.builder(
          padding: EdgeInsets.only(top: 10),
          itemCount: chats.length,
          itemBuilder: (BuildContext context, int index) {
            final Message chat = chats[index];

            return Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  // MaterialPageRoute(
                  //   builder: (_) => ChatsScreen(
                  //     user: chat.sender,
                  //   ),
                  // ),
                  // );
                  Navigator.pushNamed(context, ChatsScreen.routeName,
                      arguments: chat.sender);
                },
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: chat.unread
                        ? backgroundColor.withOpacity(0.3)
                        : Colors.transparent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            radius: 40.0,
                            backgroundImage: AssetImage(
                              chat.sender.imageUrl,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  chat.sender.name,
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.8,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  chat.text,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                    letterSpacing: 0.8,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30.0, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  chat.time,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white24,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                chat.unread
                                    ? Container(
                                        height: 25,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: const Center(
                                          child: Text(
                                            'new',
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Text(""),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    ));
  }
}
