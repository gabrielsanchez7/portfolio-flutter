import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/modules/coffee/coffee_view.dart';
import 'package:portfolio/modules/locations/location_view.dart';
import 'package:portfolio/modules/mountains/mountain_view.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Get.to(() => MountainView()),
              child: Text('Mountains'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () => Get.to(() => LocationView()),
              child: Text('Locations'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () => Get.to(() => CoffeeView()),
              child: Text('Coffee'),
            )
          ]
        ),
      )
    );
  }
}