import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:leasing_car/repository/auth_service.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService _authService = AuthService();
  UserCredential? _userCredential;

  LoginBloc() : super(LoginInitial()) {
    on<SignUpWithEmailEvent>(_onSignWithEmail);
    on<SignUpWithGoogleEvent>(_onLoginWithGoogle);
    on<SignOutEvent>(_onSignOut);
    on<GetUserEvent>(_onGetUser);
    on<SignUpAsGuest>(_onContinueAsGuest);
  }
  _onContinueAsGuest(SignUpAsGuest event, Emitter<LoginState> emit) async {
    final guestCredential = await _authService.signUpAsGuest();
    emit(
      LoginAsGuestState(
        userCredential: guestCredential,
      ),
    );
  }

  _onGetUser(GetUserEvent event, Emitter<LoginState> emit) async {
    User? user = _authService.getCurrentUser();
    emit(
      LoginWithEmailState().copyWith(
        user: user,
      ),
    );
  }

  _onSignOut(SignOutEvent event, Emitter<LoginState> emit) {
    _authService.signOut();
    emit(
      LogOutedState(),
    );
  }

  _onSignWithEmail(
    SignUpWithEmailEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoadingState());
    try {
      final userCredential =
          await _authService.signInWithEmail(event.email, event.password);
      _userCredential = userCredential;
      emit(
        LoginWithEmailState(userCredential: userCredential, success: true),
      );
    } on FirebaseAuthException catch (e) {
      emit(
        LoginDeniedState(exception: e, isLogin: true),
      );
      try {
        final userCredential =
            await _authService.signUpWithEmail(event.email, event.password);
        if (userCredential.user != null) {
          _userCredential = userCredential;
          emit(
            LoginWithEmailState(userCredential: userCredential, success: true),
          );
        } else {
          _userCredential = userCredential;
          emit(
            LoginWithEmailState(userCredential: userCredential, success: false),
          );
        }
      } on FirebaseAuthException catch (e) {
        emit(
          LoginDeniedState(
            exception: e,
            isLogin: false,
          ),
        );
      }
    }
  }

  _onLoginWithGoogle(
      SignUpWithGoogleEvent event, Emitter<LoginState> emit) async {}
}
