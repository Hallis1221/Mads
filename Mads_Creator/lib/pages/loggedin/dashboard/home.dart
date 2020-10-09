import 'package:Mads_Creator/widgets/dashboardPage.dart';
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
    return Scaffold(
      body: DashPage(
        selected: {
          "Home": true,
          "Content": false,
          "Settings": false,
        },
        page: Container(
          child: Column(
            children: [
              SizedBox(height: 75),
              Row(
                children: [
                  SizedBox(width: 150),
                  if (currentUser != null)
                    Text(
                      "Welcome, " + currentUser.email.toString(),
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 50,
                        color: Colors.black,
                      ),
                    ),
                  if (currentUser == null)
                    Text(
                      "Hmm... You're not logged in",
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 50,
                          color: Colors.black),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
