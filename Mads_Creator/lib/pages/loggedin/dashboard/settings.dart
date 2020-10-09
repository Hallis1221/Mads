import 'package:Mads_Creator/widgets/dashboardPage.dart';
import 'package:Mads_Creator/widgets/sidelayout.dart';
import 'package:Mads_Creator/pages/loggedin/dashboard/content.dart';
import 'package:Mads_Creator/pages/loggedin/dashboard/home.dart';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

RandomColor _randomColor = RandomColor();

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashPage(
        selected: {
          "Home": false,
          "Content": false,
          "Settings": true,
        },
        page: Expanded(
          child: Container(
            color: _randomColor.randomColor(),
          ),
        ),
      ),
    );
  }
}
