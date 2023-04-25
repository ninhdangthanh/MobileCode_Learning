import 'package:chat_app_ui_clone/chat_screen.dart';
import 'package:chat_app_ui_clone/widgets/category_selector.dart';
import 'package:chat_app_ui_clone/widgets/favorite_contact.dart';
import 'package:chat_app_ui_clone/widgets/menu_chat.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final Color containerBackground = Color(0xFF112734);
final Color backgroundColor = Color(0xFF283F4D);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: "/",
      routes: {
        'ChatsScreen': (context) => ChatsScreen(),
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {},
        ),
        title: const Text(
          'Chats',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          CategoriesSelector(),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: containerBackground,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Favorite Contacts',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white54,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.8,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.more_horiz),
                        iconSize: 40.0,
                        color: Colors.white54,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                FavoriteContacts(),
                MenuChate()
              ],
            ),
          ))
        ],
      ),
    );
  }
}
