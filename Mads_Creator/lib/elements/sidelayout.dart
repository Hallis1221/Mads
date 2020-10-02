import 'package:flutter/material.dart';
import 'package:Mads_Creator/pages/public/login.dart';

class SideLayout extends StatelessWidget {
  const SideLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: Color(0xff404040),
          child: Column(
            children: <Widget>[
              SizedBox(height: 70),
              Image.asset('assets/images/logo.png'),
              Text(
                'Welcome, ' + currentUser.email.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
