import 'package:Mads_Creator/elements/sidelayout.dart';
import 'package:flutter/material.dart';
import 'package:Mads_Creator/pages/public/login.dart';

class DashboardHomepage extends StatefulWidget {
  DashboardHomepage({Key key}) : super(key: key);
  @override
  _DashboardHomepageState createState() => _DashboardHomepageState();
}

class _DashboardHomepageState extends State<DashboardHomepage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SideLayout(),
        Expanded(
          flex: 4,
          child: Container(
            color: Colors.red,
          ), //your child
        ),
      ],
    );
  }
}
