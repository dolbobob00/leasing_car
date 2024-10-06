import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:leasing_car/data/models/car_model.dart';
import 'package:leasing_car/presentation/features/car_card.dart';
import 'package:leasing_car/presentation/features/glass_container.dart';
import 'package:leasing_car/presentation/pages/auth_page/bloc/login_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final cars = [
    Car(
      forGuest: false,
      model: 'Toyota',
      distance: 2993,
      fuelCapacity: 40,
      pricePerHour: 250,
    ),
    Car(
      forGuest: false,
      model: 'Toyota',
      distance: 2993,
      fuelCapacity: 40,
      pricePerHour: 250,
    ),
    Car(
      forGuest: false,
      model: 'Toyota',
      distance: 2993,
      fuelCapacity: 40,
      pricePerHour: 250,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LoginBloc>(context)
      ..add(
        GetUserEvent(),
      );
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Column(
          children: [
            const DrawerHeader(
              child: Icon(
                Icons.car_rental,
                size: 96,
              ),
            ),
            ListTile(
              onTap: () {
                context.go('/home');
              },
              style: Theme.of(context).listTileTheme.style,
              title: Text(
                'Car rental',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),
            ListTile(
              onTap: () {
                context.go('/settings');
              },
              style: Theme.of(context).listTileTheme.style,
              title: Text(
                'Settings',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),
            ListTile(
              onTap: () {
                BlocProvider.of<LoginBloc>(context).add(
                  SignOutEvent(),
                );
                context.go('/auth');
              },
              style: Theme.of(context).listTileTheme.style,
              title: Text(
                'Leave account',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),
            GlassContainer(
                widget: BlocBuilder(
                  bloc: bloc,
                  builder: (context, state) {
                    if (state is LoginWithEmailState) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        child: TextButton(
                          onPressed: () {
                            state.user == null
                                ? context.go('/auth')
                                : print('');
                          },
                          child: Text(state.user == null
                              ? 'Time to login'
                              : 'Hello, ${state.user!.email ?? '???'}'),
                        ),
                      );
                    }
                    if (state is LoginAsGuestState) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        child: TextButton(
                          onPressed: () {
                            context.go('/auth');
                          },
                          child: Text('Hello anonymous... Login please.'),
                        ),
                      );
                    }
                    return CircularProgressIndicator.adaptive();
                  },
                ),
                height: null,
                width: null),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "Choose your car",
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: cars.length,
          itemBuilder: (BuildContext context, int index) {
            return CarCard(
              carInfo: cars[index],
            );
          },
        ),
      ),
    );
  }
}
