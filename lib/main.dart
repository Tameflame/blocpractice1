import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:newazam/bloc/bloc.dart';
import 'package:newazam/bloc/bloc_delegate.dart';
import 'package:newazam/pages/login_form_page.dart';
import 'bloc/pagemanager_bloc.dart';
import 'package:newazam/pages/login_signup_page.dart';
import 'pages/splash_page.dart';

main() {
  BlocSupervisor.delegate = MyBlocDelegate();
  runApp(BlocProvider(
    builder: (BuildContext context) => new PageManagerBloc()
    ..dispatch(GotoLoginOrSignupPage()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<PageManagerBloc, PageManagerState>(
        builder: (context, state) {
          if (state is ShowLoginFormPage) {
            return LoginFormPage();
          } else if (state is ShowLoginOrSignupPage) {
            return LoginSignupPage();
          } else if (state is ShowSplashPage) {
            return SplashPage();
          }
          else throw Exception("Something went wrong here");
        },
      ),
    );
  }
}