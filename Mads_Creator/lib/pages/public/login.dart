import 'package:Mads_Creator/pages/loggedin/dashboard/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

User currentUser;

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("v.0.08"),),
      body: Container(
        child: Center(
          child: LoginContent(
            disclaimer: 'Welcome back! Please login to your account.',
            hintTextOne: 'Email',
            hintTextTwo: 'Password',
          ),
        ),
      ),
    );
  }
}

class LoginContent extends StatefulWidget {
  final String disclaimer;
  final String hintTextOne;
  final String hintTextTwo;

  const LoginContent({
    Key key,
    @required this.disclaimer,
    @required this.hintTextOne,
    @required this.hintTextTwo,
  }) : super(key: key);

  @override
  _LoginContentState createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  String _error = '';
  final _controllerOne = TextEditingController();
  final _controllerTwo = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
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
                widget.disclaimer,
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
                hintText: widget.hintTextOne,
                controller: _controllerOne,
                validatorSigns: (input) {
                  //todo
                  return '';
                },
              ),
              Input(
                hintText: widget.hintTextTwo,
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
              currentUser = (await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _controllerOne.text,
                          password: _controllerTwo.text))
                  .user;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashboardHomepage()));
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
    );
  }
}

class Input extends StatelessWidget {
  const Input(
      {Key key,
      @required this.hintText,
      @required this.controller,
      @required this.validatorSigns,
      this.obscure = false})
      : super(key: key);

  final bool obscure;
  final TextEditingController controller;
  final String hintText;
  final Function validatorSigns;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 15.0, right: 15.0),
      child: Container(
        width: 400,
        child: TextFormField(
          obscureText: obscure,
          validator: validatorSigns,
          controller: controller,
          cursorColor: Colors.black,
          decoration: new InputDecoration(
              hintText: hintText,
              border: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder()),
        ),
      ),
    );
  }
}
