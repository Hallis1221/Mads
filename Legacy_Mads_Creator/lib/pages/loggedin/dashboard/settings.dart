import 'dart:math';

import 'package:Mads_Creator/pages/public/login.dart';
import 'package:Mads_Creator/pages/public/routed/signup.dart';
import 'package:Mads_Creator/widgets/dashboardPage.dart';
import 'package:Mads_Creator/widgets/sidelayout.dart';
import 'package:Mads_Creator/pages/loggedin/dashboard/content.dart';
import 'package:Mads_Creator/pages/loggedin/dashboard/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_color/random_color.dart';

RandomColor _randomColor = RandomColor();
String uid;

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
        page: Container(
          child: Column(
            children: [
              SizedBox(height: 75),
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
                            "Settings Panel",
                            style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SettingsPanel(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsPanel extends StatelessWidget {
  const SettingsPanel({
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
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.75,
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
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      CreateMagicID(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CreateMagicID extends StatelessWidget {
  const CreateMagicID({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: 250,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                25,
              ),
            ),
            color: Color.fromARGB(255, 60, 59, 84),
          ),
          child: FlatButton(
            onPressed: () async {
              String password = "ABY^e#_Pv5v_9Vz^";
              // var rng = new Random();
              // for (var i = 0; i < 100; i++) {
              // password += rng.nextInt(100).toString();
              // }
              print(password);
              var tempUser =
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: "temp@vivelstad.com",
                password: password,
              );
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                email: "temp@vivelstad.com",
                password: password,
              )
                  .then((tempUserCredentials) {
                tempUserCredentials.user.updateEmail(
                  tempUserCredentials.user.uid.toString() + "@" + domain,
                );
                Clipboard.setData(ClipboardData(
                    text: tempUserCredentials.user.uid.toString()));
              });
            },
            child: Container(
                child: Text(
              "Click to generate user invite",
              style:
                  TextStyle(color: Colors.white, fontFamily: "SourceSansPro"),
            )),
          ),
        ),
      ),
    );
  }
}
