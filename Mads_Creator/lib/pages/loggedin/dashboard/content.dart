import 'package:Mads_Creator/elements/sidelayout.dart';
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Container(
            width: width / 5,
            height: height,
            child: SideLayout(
              navigationItems: [
                NavigationItem(
                  onClicked: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            DashboardHomepage(),
                      ),
                    );
                  },
                  icon: Icons.home_outlined,
                  selected: false,
                  text: "Home",
                ),
                NavigationItem(
                  icon: Icons.insert_drive_file_sharp,
                  onClicked: () {},
                  text: "Content",
                  selected: true,
                ),
                NavigationItem(
                  onClicked: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            Settings(),
                      ),
                    );
                  },
                  selected: false,
                  icon: Icons.settings,
                  text: "Settings",
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: _randomColor.randomColor(),
            ),
          ),
        ],
      ),
    );
  }
}
