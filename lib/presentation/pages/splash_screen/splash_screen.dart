import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leasing_car/core/theming.dart';

import 'package:leasing_car/presentation/pages/splash_screen/bloc/splash_screen_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SplashScreenBloc>(context)
      ..add(
        SplashScreenCheckLoggedEvent(),
      );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: Themes.gradientLight,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocListener<SplashScreenBloc, SplashScreenState>(
                bloc: bloc,
                listener: (context, state) {
                  //TODO implement check is logged when pages will done
                  if (state is SplashScreenCheckedLoggedState &&
                      state.isLogged == true) {
                    context.go('/home');
                  }
                  if (state is SplashScreenCheckedLoggedState &&
                      state.isLogged == false) {
                    context.go('/auth');
                  }
                },
                child: Column(
                  children: [
                    Text(
                      'C a r  L e a s i n g',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'debug',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
