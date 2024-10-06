part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

// ignore: must_be_immutable
class SignUpWithEmailEvent extends LoginEvent {
  final String email;
  final String password;
  SignUpWithEmailEvent({required this.email, required this.password});
}

class SignUpAsGuest extends LoginEvent {}

class GetUserEvent extends LoginEvent {}

class SignOutEvent extends LoginEvent {}

class SignUpWithGoogleEvent extends LoginEvent {}
