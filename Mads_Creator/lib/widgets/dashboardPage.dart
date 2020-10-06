import 'package:Mads_Creator/pages/loggedin/dashboard/content.dart';
import 'package:Mads_Creator/widgets/sidelayout.dart';
import 'package:Mads_Creator/pages/loggedin/dashboard/home.dart';
import 'package:Mads_Creator/pages/loggedin/dashboard/settings.dart';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

RandomColor _randomColor = RandomColor();

class DashPage extends StatefulWidget {
  DashPage({
    Key key,
    this.selected = const {
      "Home": false,
      "Dashboard": false,
      "Settings": false
    },
    @required this.page,
  }) : super(key: key);

  final Map<String, bool> selected;

  final Widget page;
  @override
  _DashPageState createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {
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
                  icon: Icons.home_outlined,
                  selected: widget.selected["Home"],
                  text: "Home",
                  onClicked: () {
                    if (!widget.selected["Home"]) {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              DashboardHomepage(),
                        ),
                      );
                    } else {}
                  },
                ),
                NavigationItem(
                  icon: Icons.insert_drive_file_sharp,
                  text: "Content",
                  selected: widget.selected["Content"],
                  onClicked: () {
                    if (!widget.selected["Content"]) {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              Content(),
                        ),
                      );
                    } else {}
                  },
                ),
                NavigationItem(
                  selected: widget.selected["Settings"],
                  icon: Icons.settings,
                  text: "Settings",
                  onClicked: () {
                    if (!widget.selected["Settings"]) {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              Settings(),
                        ),
                      );
                    } else {}
                  },
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
