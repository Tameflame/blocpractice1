import 'package:meta/meta.dart';

@immutable
abstract class PageManagerEvent {}


class GotoLoginFormPage extends PageManagerEvent {}

class GotoCreateAccountPage extends PageManagerEvent {}

class GotoLoginOrSignupPage extends PageManagerEvent {}

class GotoSplashPage extends PageManagerEvent {}