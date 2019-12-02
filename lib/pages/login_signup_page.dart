import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newazam/bloc/bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginSignupPage extends StatefulWidget {
  @override
  _LoginSignupPageState createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
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
                  padding: EdgeInsets.only(top: 100),
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
                child: BlocProvider(
                  builder: (context) => BlocProvider.of<PageManagerBloc>(context),
                  child: LoginSignupContainer())
                )
          ],
        ),
      ]),
    );
  }
}

class LoginSignupContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            color: Colors.white),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            BlocProvider(
              builder: (context) => BlocProvider.of<PageManagerBloc>(context),
              child: LoginButton()),
            SizedBox(
              height: 20,
            ),
            SignupButton(),
          ],
        ));
  }
}

class LoginButton extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: FlatButton(
        onPressed: () {
          print("Login Button Pressed!");
          BlocProvider.of<PageManagerBloc>(context).dispatch(GotoLoginFormPage());
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

class SignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: FlatButton(
        onPressed: () {
          print("Signup Button Pressed!");
        },
        child: Text(
          "Create Account",
          style: TextStyle(color: Color(0xFF07877D), fontSize: 18),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side:
                BorderSide(color: Color(0xFF07877D), style: BorderStyle.solid)),
        color: Colors.white,
      ),
    );
  }
}
