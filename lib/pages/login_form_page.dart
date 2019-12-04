import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:newazam/bloc/bloc.dart';

class LoginFormPage extends StatefulWidget {
  @override
  _LoginFormPageState createState() => _LoginFormPageState();
}

class _LoginFormPageState extends State<LoginFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          height: double.infinity,
          decoration: BoxDecoration(color: Color(0xFFE3EBEE)),
        ),
        Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "A",
                          style: TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextSpan(
                          text: ".",
                          style: TextStyle(
                              fontSize: 100,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF07877D))),
                    ]),
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: LoginFormContainer(),
                ),
          ],
        ),
      ]),
    );
  }
}

class LoginFormContainer extends StatefulWidget {
  @override
  _LoginFormContainerState createState() => _LoginFormContainerState();
}

class _LoginFormContainerState extends State<LoginFormContainer> {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();
  String _pass = "";
  String _email = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 450,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            color: Colors.white),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(hintText: "Email"),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  _email = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: TextField(
                obscureText: true,
                controller: _passController,
                decoration: InputDecoration(hintText: "Password"),
                onChanged: (value) {
                  _pass = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: signinButton(),
            ),
            Padding(padding: EdgeInsets.only(top: 40)),
            Text(
              "Need Support?",
              style: TextStyle(color: Color(0xFF07877D), fontSize: 18),
            ),
            Padding(padding: EdgeInsets.only(top: 40)),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    BlocProvider.of<PageManagerBloc>(context)
                        .dispatch(GotoLoginOrSignupPage());
                  },
                ),
              ),
            ),
          ],
        ));
  }

  Widget signinButton() {
    return Container(
      width: double.infinity,
      height: 55,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: FlatButton(
        onPressed: () {
          print("Login Button Pressed!");
          print("Email: $_email, Password: $_pass");
        },
        child: Text(
          "Sign In",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Color(0xFF07877D),
      ),
    );
  }
}
