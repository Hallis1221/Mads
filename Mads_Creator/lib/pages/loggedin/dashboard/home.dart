import 'dart:html';

import 'package:Mads_Creator/widgets/dashboardPage.dart';
import 'package:flutter/material.dart';
import 'package:Mads_Creator/pages/public/login.dart';
import 'package:flutter/foundation.dart';
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
      page: Container(
        child: Column(
          children: [
            SizedBox(height: 75),
            if (kReleaseMode)
              Stack(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 20,
                        height: MediaQuery.of(context).size.width / 100,
                      ),
                      Column(
                        children: [
                          if (currentUser != null)
                            Text(
                              "Welcome, " + currentUser.email.toString(),
                              style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                                color: Colors.black,
                              ),
                            ),
                          if (currentUser == null && kReleaseMode)
                            Text(
                              "Hmm... You're not logged in",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50,
                                  color: Colors.black),
                            ),
                        ],
                      ),
                    ],
                  ),
                  ContentPanel(),
                ],
              ),
            if (!kReleaseMode)
              Stack(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 20,
                        height: MediaQuery.of(context).size.width / 100,
                      ),
                      Column(
                        children: [
                          Text(
                            "Hmm... You're not logged in",
                            style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.width / 35 +
                                  MediaQuery.of(context).size.height / 75,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '(The app is running in debug mode)',
                          ),
                        ],
                      ),
                    ],
                  ),
                  ContentPanel(),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class ContentPanel extends StatelessWidget {
  const ContentPanel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 50,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 2.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(
                          10,
                          0,
                          0,
                          0,
                        ),
                        blurRadius: 6,),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
