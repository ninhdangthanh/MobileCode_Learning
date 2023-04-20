import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/category.dart';
import '../../model/event.dart';
import '../../styleguide.dart';
import '../event_details/event_details_page.dart';
import 'category_widget.dart';
import 'event_widget.dart';
import 'home_background.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategoryId = 0;

  void _updateData(int newId) {
    setState(() {
      _selectedCategoryId = newId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomePageBackground(screenHeight: MediaQuery.of(context).size.height),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Row(
                      children: [
                        Text(
                          "LOCAL EVENTS",
                          style: fadedTextStyle,
                        ),
                        Expanded(child: Container()),
                        const Icon(
                          Icons.person_outline,
                          color: Color(0x99FFFFFF),
                          size: 30,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      "What's Up",
                      style: whiteHeadingTextStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (final category in categories)
                            CategoryWidget(
                                category: category,
                                selectedCategoryId: _selectedCategoryId,
                                onChangeId: _updateData)
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      for (final event in events.where((e) => e.categoryIds
                          .contains(_selectedCategoryId)))
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      EventDetailsPage(event: event)));
                            },
                            child: EventWidget(
                              event: event,
                            ))
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
    ;
  }
}
