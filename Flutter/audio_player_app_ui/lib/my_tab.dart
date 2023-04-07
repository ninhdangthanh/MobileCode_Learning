import 'package:flutter/cupertino.dart';
import 'package:audio_player_app_ui/audio/app_colors.dart' as AppColors;
import 'package:flutter/material.dart';


class AppTabs extends StatelessWidget {
  final Color color;
  final String text;
  const AppTabs({Key? key, required this.color, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120, height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2)
            )
          ]
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

}
