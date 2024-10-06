import 'package:flutter/material.dart';
import 'package:leasing_car/data/models/car_model.dart';

class CarCard extends StatelessWidget {
  final Car carInfo;

  const CarCard({super.key, required this.carInfo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: const Color(0xffF3F3F3),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ]),
        child: Column(
          children: [
            Image.asset(
              'assets/img/carExample.png',
              height: 120,
            ),
            Text(
              carInfo.model,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.navigation,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Text(
                          ' ${carInfo.distance.toStringAsFixed(0)}km',
                          style: Theme.of(context).textTheme.titleSmall,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.local_gas_station,
                          color: Color.fromRGBO(140, 11, 2, 1),
                        ),
                        Text(' ${carInfo.fuelCapacity.toStringAsFixed(0)}L',
                            style: Theme.of(context).textTheme.titleSmall)
                      ],
                    ),
                  ],
                ),
                Text(
                  '\$${carInfo.pricePerHour.toStringAsFixed(2)}/h',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 16,
                      ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
