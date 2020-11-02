import 'package:Mads_Creator/pages/loggedin/dashboard/settings.dart';
import 'package:Mads_Creator/pages/public/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

TextEditingController controller = TextEditingController();
String _error = "";
String disclaimer = "Enter the invite code you got by a MADS admin here. ";
String hintText = "UID / Invite code";
String domain = "vivelstad.com";

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/logo.png',
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 3,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 15,
                child: Opacity(
                  opacity: 0.75,
                  //TODO fix for mobile  |
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      disclaimer,
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 22,
                          color: Color.fromARGB(255, 77, 79, 92)),
                    ),
                  ),
                ),
              ),
              Text(_error),
              SizedBox(
                height: 50,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Input(
                      hintText: hintText,
                      controller: controller,
                      validatorSigns: (input) {
                        //todo
                        return '';
                      },
                    ),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () async {
                  final formState = _formKey.currentState;
                  if (formState.validate()) {
                    formState.save();
                  }
                  print(controller.text.toLowerCase() + "@" + domain);
                  try {
                    print(controller.text.toLowerCase() + "@" + domain);
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email:
                                controller.text.toLowerCase() + "@" + domain,
                            password: 'ABY^e#_Pv5v_9Vz^')
                        .then((value) {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              ChangeCredentials(
                            uid: controller.text,
                          ),
                        ),
                      );
                    });
                  } catch (e) {
                    setState(() {
                      _error = e.toString();
                    });
                  }
                },
                child: Container(
                  height: 75,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 60, 59, 84),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChangeCredentials extends StatefulWidget {
  ChangeCredentials({Key key, @required this.uid}) : super(key: key);

  final String uid;

  @override
  __ChangeCredentialsState createState() => __ChangeCredentialsState();
}

class __ChangeCredentialsState extends State<ChangeCredentials> {
  @override
  Widget build(BuildContext context) {
    String _disclaimer = "Enter a email and password";
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final _controllerOne = TextEditingController();
    final _controllerTwo = TextEditingController();
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/logo.png',
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 3,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 15,
                child: Opacity(
                  opacity: 0.75,
                  //TODO fix for mobile  |
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _disclaimer,
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 22,
                          color: Color.fromARGB(255, 77, 79, 92)),
                    ),
                  ),
                ),
              ),
              Text(_error),
              SizedBox(
                height: 50,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Input(
                      hintText: "email",
                      controller: _controllerOne,
                      validatorSigns: (input) {
                        //todo
                        return '';
                      },
                    ),
                    Input(
                      hintText: "password",
                      controller: _controllerTwo,
                      obscure: true,
                      validatorSigns: (input) {
                        //todo
                        return '';
                      },
                    ),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () async {
                  final formState = _formKey.currentState;
                  if (formState.validate()) {
                    formState.save();
                  }

                  try {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: widget.uid.toLowerCase() + "@" + domain,
                            password: 'ABY^e#_Pv5v_9Vz^')
                        .then((tempUserCredentials) {
                      tempUserCredentials.user.updateEmail(_controllerOne.text);
                      tempUserCredentials.user
                          .updatePassword(_controllerTwo.text);
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                    setState(() {
                      _error = currentUser.email.toString();
                    });
                  } catch (e) {
                    setState(() {
                      _error = e.toString();
                    });
                  }
                },
                child: Container(
                  color: Colors.red,
                  height: 50,
                  width: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
