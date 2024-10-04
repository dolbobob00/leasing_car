import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leasing_car/core/theming.dart';
import 'package:leasing_car/pages/home_page/home_page.dart';
import 'package:leasing_car/pages/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:leasing_car/pages/splash_screen/splash_screen.dart';
import 'firebase_options.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final GoRouter _goRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return Container();
        },
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) {
          return HomePage();
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final SplashScreenBloc splashBloc = SplashScreenBloc()
      ..add(
        SplashScreenCheckLoggedEvent(),
      );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => splashBloc,
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _goRouter,
        theme: Themes.isLight ?? true ? Themes.themeLight : Themes.themeLight,
      ),
    );
  }
}
