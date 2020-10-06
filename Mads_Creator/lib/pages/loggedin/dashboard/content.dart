import 'package:Mads_Creator/widgets/dashboardPage.dart';
import 'package:Mads_Creator/widgets/sidelayout.dart';
import 'package:Mads_Creator/pages/loggedin/dashboard/home.dart';
import 'package:Mads_Creator/pages/loggedin/dashboard/settings.dart';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

RandomColor _randomColor = RandomColor();

class Content extends StatefulWidget {
  Content({Key key}) : super(key: key);
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return DashPage(
      selected: {
        "Home": false,
        "Content": true,
        "Settings": false,
      },
      page: Expanded(
        child: Container(
          color: _randomColor.randomColor(),
        ),
      ),
    );
  }
}
