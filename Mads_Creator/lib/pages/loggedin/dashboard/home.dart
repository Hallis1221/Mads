import 'package:Mads_Creator/widgets/dashboardPage.dart';
import 'package:Mads_Creator/widgets/sidelayout.dart';
import 'package:Mads_Creator/pages/loggedin/dashboard/content.dart';
import 'package:Mads_Creator/pages/loggedin/dashboard/settings.dart';
import 'package:flutter/material.dart';
import 'package:Mads_Creator/pages/public/login.dart';
import 'package:random_color/random_color.dart';

RandomColor _randomColor = RandomColor();

class DashboardHomepage extends StatefulWidget {
  DashboardHomepage({Key key}) : super(key: key);
  @override
  _DashboardHomepageState createState() => _DashboardHomepageState();
}

class _DashboardHomepageState extends State<DashboardHomepage> {
  @override
  Widget build(BuildContext context) { 
    return DashPage(
        selected: {
          "Home": true,
          "Content": false,
          "Settings": false,
        },
        page: Expanded(
          child: Container(
            color: _randomColor.randomColor(),
          ),
        ));
  }
}
