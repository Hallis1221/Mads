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
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Container(width: width/5, height: height, child: SideLayout()),
          Expanded(
            child: Container(
              color: Colors.red,
            ), //your child
          ),
        ],
      ),
    );
  }
}
