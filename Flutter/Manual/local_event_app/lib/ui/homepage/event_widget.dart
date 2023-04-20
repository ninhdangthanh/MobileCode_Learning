import 'package:flutter/material.dart';
import 'package:local_event_app/model/event.dart';

import '../../styleguide.dart';

class EventWidget extends StatelessWidget {
  Event event;

  EventWidget({required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        color: Colors.white,
        boxShadow:[
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), //color of shadow
            spreadRadius: 2, //spread radius
            blurRadius: 3, // blur radius
            offset: Offset(0, 3), // changes position of shadow
            //first paramerter of offset is left-right
            //second parameter is top to down
          ),
          //you can set more BoxShadow() here
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Image.asset(
                event.imagePath,
                height: 150,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: Text(
                        event.title,
                        style: eventTitleTextStyle,
                      )),
                  Expanded(child: Container()),
                  Expanded(
                    flex: 1,
                    child: Text(
                      event.duration.toUpperCase(),
                      style: eventLocationTextStyle.copyWith(
                          fontWeight: FontWeight.w900),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(
                  width: 5,
                ),
                Text(
                  event.location,
                  style: eventLocationTextStyle,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
