// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<SplashScreenCheckLoggedEvent>(_onCheckingStatus);
  }

  _onCheckingStatus(
    SplashScreenCheckLoggedEvent event,
    Emitter<SplashScreenState> emit,
  ) async {
    emit(
      SplashScreenLoading(),
    );
    await Future.delayed(
      const Duration(
        seconds: 2,
        milliseconds: 500,
      ),
    );
    _firebaseAuth.currentUser == null
        ? emit(
            SplashScreenCheckedLoggedState(false, null),
          )
        : emit(
            SplashScreenCheckedLoggedState(
                true, _firebaseAuth.currentUser?.uid),
          );
  }
}
