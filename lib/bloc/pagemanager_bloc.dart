import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class PageManagerBloc extends Bloc<PageManagerEvent, PageManagerState> {
  @override
  PageManagerState get initialState => ShowLoginOrSignupPage();

  @override
  Stream<PageManagerState> mapEventToState(
    PageManagerEvent event,
  ) async* {
    if (event is GotoSplashPage) {
      yield ShowSplashPage();
    }
    if (event is GotoLoginOrSignupPage) {
      yield ShowLoginOrSignupPage();
    }
    if (event is GotoLoginFormPage) {
      yield ShowLoginFormPage();
    }
  }
}
