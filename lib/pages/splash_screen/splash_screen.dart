import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leasing_car/pages/home_page/home_page.dart';
import 'package:leasing_car/pages/splash_screen/bloc/splash_screen_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Theme.of(context).colorScheme.primary,
      child: BlocBuilder(
        bloc: context.read<SplashScreenBloc>(),
        builder: (context, state) {
          Future.delayed(
            Duration(
              seconds: 3,
            ),
          );
          if (state == SplashScreenLoading) {
            return CircularProgressIndicator.adaptive(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            );
          }
          if (state is SplashScreenCheckedLoggedState &&
              state.isLogged == true) {
            context.go(
              '/home',
            );
          }
          if (state is SplashScreenCheckedLoggedState &&
              state.isLogged == false) {
            return Text(
              "Error!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            );
          }
          return Text("Error!");
        },
      ),
    );
  }
}
