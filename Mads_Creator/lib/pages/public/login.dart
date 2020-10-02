import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  if (input.isEmpty ||
                      input.contains("@") ||
                      input.contains(".")) {
                    return 'Please enter a valid email.';
                  }
                  return '';
                },
              ),
              Input(
                hintText: widget.hintTextTwo,
                controller: _controllerTwo,
                obscure: true,
                validatorSigns: (input) {
                  if (input.isEmpty ||
                      input.contains("@") ||
                      input.contains(".")) {
                    return 'Please enter a valid password.';
                  }
                  return '';
                },
              ),
            ],
          ),
        ),
        MaterialButton(
            onPressed: () {
              final formState = _formKey.currentState;
              if (formState.validate()) {
                formState.save();
              }
              print(MediaQuery.of(context).size.width / 100);
            },
            child: Container(
              color: Colors.red,
              height: 50,
              width: 50,
            ))
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
