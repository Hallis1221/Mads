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
                  onClicked: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            Content(),
                      ),
                    );
                  },
                  text: "Content",
                ),
                NavigationItem(
                  onClicked: () => print("object"),
                  selected: true,
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
