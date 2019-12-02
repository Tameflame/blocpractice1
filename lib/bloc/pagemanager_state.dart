import 'package:meta/meta.dart';

@immutable
abstract class PageManagerState {}
  
class InitialPageManagerState extends PageManagerState {}

class ShowLoginFormPage extends PageManagerState {}

class ShowCreateAccountPage extends PageManagerState {}

class ShowLoginOrSignupPage extends PageManagerState {}

class ShowSplashPage extends PageManagerState {}