import 'package:flutter/material.dart';

import 'image_screen.dart';
import 'video_screen.dart';

class Dashboard extends StatefulWidget {
  @override
  DashboardState createState() => new DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBarView(
        children: [
          ImageScreen(),
          VideoScreen(),
        ],
      ),
    );
  }
}
