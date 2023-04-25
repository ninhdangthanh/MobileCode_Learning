import 'package:flutter/material.dart';

import '../chat_screen.dart';
import '../model/message_model.dart';

class FavoriteContacts extends StatefulWidget {
  const FavoriteContacts({Key? key}) : super(key: key);

  @override
  State<FavoriteContacts> createState() => _FavoriteContactsState();
}

class _FavoriteContactsState extends State<FavoriteContacts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
          padding: EdgeInsets.only(left: 15),
          scrollDirection: Axis.horizontal,
          itemCount: favorite.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (_) => ChatsScreen(
                //       user: chats[index].sender,
                //     ),
                //   ),
                // );
                // print('fvr ct: ${chats[index].sender}');
                Navigator.pushNamed(context, ChatsScreen.routeName,
                    arguments: chats[index].sender);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipOval(
                        child: Image.asset(
                          favorite[index].imageUrl,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      favorite[index].name,
                      style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.8,
                          color: Colors.white38),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
