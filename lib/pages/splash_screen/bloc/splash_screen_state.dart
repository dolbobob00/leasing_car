part of 'splash_screen_bloc.dart';

abstract class SplashScreenState {}

final class SplashScreenInitial extends SplashScreenState {}

class SplashScreenLoading extends SplashScreenBloc {}

class SplashScreenCheckedLoggedState extends SplashScreenState {
  SplashScreenCheckedLoggedState(
    this.isLogged,
    this.uid,
  );
  bool isLogged;
  String? uid;
}
