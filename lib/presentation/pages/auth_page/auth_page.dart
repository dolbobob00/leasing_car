import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leasing_car/presentation/features/animated_button.dart';
import 'package:leasing_car/presentation/pages/auth_page/bloc/login_bloc.dart';

class AuthOrGuest extends StatelessWidget {
  const AuthOrGuest({super.key});

  @override
  Widget build(BuildContext context) {
    final blocLogin = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    alignment: FractionalOffset(0.8, 0),
                    image: AssetImage(
                      'assets/img/car.png',
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                text: 'Premium cars.',
                              ),
                              TextSpan(
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                text: '\nEnjoy the luxury.',
                              ),
                              TextSpan(
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                text:
                                    '\nPremium car leasing offers a way to drive high-end vehicles without the long-term commitment of purchasing them. ',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 55,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonText(
                            icon: null,
                            title: 'Let\'s login.',
                            hadDecoration: true,
                            onTap: () {
                              final currentState = blocLogin.state;
                              if (currentState is LogOutedState) {
                                context.go('/auth/signup');
                              }
                              if (currentState is LoginWithEmailState &&
                                  currentState.user != null) {
                                context.go('/home');
                              } else {
                                context.go('/auth/signup');
                              }
                            },
                          ),
                          ButtonText(
                            icon: null,
                            title: 'or want continue as guest?',
                            onTap: () {
                              blocLogin.add(
                                SignUpAsGuest(),
                              );
                              context.go(
                                '/home',
                              );
                            },
                            hadDecoration: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
