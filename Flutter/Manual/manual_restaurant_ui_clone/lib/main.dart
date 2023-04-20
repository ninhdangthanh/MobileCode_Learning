import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

var bannerItems = ["Burger", "Cheese Chilly", "Noodles", "Pizza"];
var bannerImage = [
  "images/burger.jpg",
  "images/cheesechilly.jpg",
  "images/noodles.jpg",
  "images/pizza.jpg",
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(icon: Icon(Icons.menu), onPressed: () {}),
                  const Text(
                    "Foodies",
                    style: TextStyle(fontSize: 50, fontFamily: "Samantha"),
                  ),
                  IconButton(icon: Icon(Icons.person), onPressed: () {})
                ],
              ),
            ),
            BannerWidgetArea(),
            ListFood(),
          ],
        ),
      ),
    );
  }
}

class ListFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<List<Widget>> createList() async {
      List<Widget> items = <Widget>[];
      String dataString =
          await DefaultAssetBundle.of(context).loadString("assets/data.json");
      List<dynamic> dataJSON = jsonDecode(dataString);

      dataJSON.forEach((object) {
        String finalString = "";
        List<dynamic> dataList = object["placeItems"];
        dataList.forEach((item) {
          finalString = finalString + item + " | ";
        });
        print(object["placeName"]);

        items.add(Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, spreadRadius: 2.0, blurRadius: 5.0),
              ]),
          margin: EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0)),
                child: Image.asset(
                  object["placeImage"],
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 250,
                child: Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(object["placeName"]),
                      Container(
                        padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                        child: Text(
                          finalString,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.black54,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      Text(
                        "Min. Order: ${object["minOrder"]}",
                        style:
                        TextStyle(fontSize: 12.0, color: Colors.black54),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
      });

      return items;
    }

    return Container(
      child: FutureBuilder(
          initialData: <Widget>[Text("")],
          future: createList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: ListView(
                  primary: false,
                  shrinkWrap: true,
                  children: snapshot.requireData,
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}

class BannerWidgetArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    PageController controller =
        PageController(viewportFraction: 0.8, initialPage: 1);

    List<Widget> banners = <Widget>[];

    for (int i = 0; i < bannerItems.length; i++) {
      var bannerView = Padding(
        padding: EdgeInsets.all(10),
        child: Stack(
          // fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 5.0,
                        spreadRadius: 1.0)
                  ]),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              child: Image.asset(
                bannerImage[i],
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black])),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bannerItems[i],
                    style: const TextStyle(fontSize: 25.0, color: Colors.red),
                  ),
                  const Text(
                    "More than 40% Off",
                    style: TextStyle(fontSize: 12.0, color: Colors.red),
                  )
                ],
              ),
            )
          ],
        ),
      );
      banners.add(bannerView);
    }

    return Container(
      width: screenWidth,
      height: screenWidth * 9 / 16,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: banners,
      ),
    );
  }
}
