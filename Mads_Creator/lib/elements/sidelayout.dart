import 'package:flutter/material.dart';
import 'package:Mads_Creator/pages/public/login.dart';


class SideLayout extends StatelessWidget {
  const SideLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Color.fromARGB(255, 67, 66, 93),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Color.fromARGB(255, 60, 59, 84),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 49),
                    Image.asset('assets/images/logo.png'),
                    SizedBox(height: 35),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            NavigationItem(
              onClicked: () => print(MediaQuery.of(context).size.width),
              icon: Icons.home_outlined,
              selected: true, text: "Home",
            ),
            NavigationItem(
              onClicked: () => print("object"),
              selected: false,
              icon: Icons.settings, text: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationItem extends StatelessWidget {
  const NavigationItem({
    Key key,
    this.selected = false,
    @required this.onClicked,
    @required this.icon, @required this.text,
  }) : super(key: key);

  final bool selected;

  final double height = 100;

  final Function onClicked;

  final IconData icon;

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        // A bit of a hacky solution in order to be able to use if
        children: [
          Stack(
            children: [
              if (selected)
                Row(
                  children: [
                    Container(
                      color: Color.fromARGB(255, 163, 160, 251),
                      height: height,
                      width: 10,
                    ),
                    Expanded(
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: onClicked,
                        child: Container(
                          color: Color.fromARGB(255, 60, 59, 84),
                          width: double.maxFinite,
                          height: height,
                        ),
                      ),
                    ),
                  ],
                ),
              if (!selected)
                Row(
                  children: [
                    Container(
                      height: height,
                      width: 10,
                    ),
                    Expanded(
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: onClicked,
                        focusColor: Color.fromARGB(255, 60, 59, 84),
                        child: Container(
                          width: double.maxFinite,
                          height: height,
                        ),
                      ),
                    ),
                  ],
                ),
              Column(
                children: [
                  SizedBox(height: 40, width: 50),
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      if (selected)
                        Icon(
                          icon,
                          color: Color.fromARGB(255, 163, 160, 251),
                          size: 30,
                        ),
                      if (!selected)
                        Icon(
                          icon,
                          color: Colors.white,
                          size: 30,
                        ),
                      SizedBox(
                        width: 10,
                      ),
                      if (MediaQuery.of(context).size.width >= 1000)
                      Text(
                        text,
                        style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40, width: 50),
                ],
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
