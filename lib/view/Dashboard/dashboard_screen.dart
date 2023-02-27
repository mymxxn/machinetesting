import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest/Controller/controller.dart';
import 'package:weather_icons/weather_icons.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  final controller = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 121, 87, 127),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 98, 25, 111),
        leading: Icon(Icons.menu),
        toolbarHeight: 70,
        title: CupertinoSearchTextField(),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: ListView(
          children: [
            Image.network(
              "http:${controller.currenttemperature.value.current?.condition?.icon ?? ""}",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Weather",
                  style: TextStyle(color: Colors.white54, fontSize: 18),
                ),
                Text(
                  "${controller.currenttemperature.value.current?.condition?.text ?? ""}",
                  style: TextStyle(color: Colors.white54, fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cloud",
                  style: TextStyle(color: Colors.white54, fontSize: 18),
                ),
                Text(
                  "${controller.currenttemperature.value.current?.cloud ?? ""}",
                  style: TextStyle(color: Colors.white54, fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Humidity",
                  style: TextStyle(color: Colors.white54, fontSize: 15),
                ),
                Text(
                  "${controller.currenttemperature.value.current?.humidity ?? ""}",
                  style: TextStyle(color: Colors.white54, fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Temperature",
                  style: TextStyle(color: Colors.white54, fontSize: 18),
                ),
                Text(
                  "${controller.currenttemperature.value.current?.tempC ?? ""}",
                  style: TextStyle(color: Colors.white54, fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Place",
                  style: TextStyle(color: Colors.white54, fontSize: 18),
                ),
                Text(
                  "${controller.currenttemperature.value.location?.name ?? ""} - ${controller.currenttemperature.value.location?.region ?? ""}",
                  style: TextStyle(color: Colors.white54, fontSize: 15),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
