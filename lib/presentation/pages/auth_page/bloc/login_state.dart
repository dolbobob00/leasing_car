part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

class LoginDeniedState extends LoginState {
  FirebaseException exception;
  bool? isLogin = false;
  LoginDeniedState({required this.exception, this.isLogin});
}

final class LoginAsGuestState extends LoginState {
  final UserCredential? userCredential;

  LoginAsGuestState({required this.userCredential});
}

final class LogOutedState extends LoginState {}

final class LoginWithEmailState extends LoginState {
  final UserCredential? userCredential;
  User? user;
  bool? success;
  LoginWithEmailState({this.userCredential, this.success, this.user});
  LoginWithEmailState copyWith({
    final UserCredential? userCredential,
    User? user,
    bool? success,
  }) {
    return LoginWithEmailState(
      userCredential: userCredential ?? this.userCredential,
      success: success ?? this.success,
      user: user ?? this.user,
    );
  }
}

final class LoginWithGoogleState extends LoginState {
  final UserCredential userCredential;

  LoginWithGoogleState({required this.userCredential});
}
