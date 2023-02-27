import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:machinetest/Model/current_weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:machinetest/Utils/Route%20Manager/route_manager.dart';
import 'package:machinetest/view/Dashboard/dashboard_screen.dart';

class WeatherController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getCurrentIpAddress();
  }

  var currentIpAddress = "".obs;
  var currentLocation = "".obs;
  var currenttemperature = CurrentWeather().obs;

  //-------------Get Current Location IP Address---------------//
  getCurrentIpAddress() async {
    try {
      var result;
      final response =
          await http.get(Uri.parse('https://api.ipify.org/?format=json'));
      if (response != null) {
        result = jsonDecode(response.body);
        log("$result");
        currentIpAddress.value = result['ip'];
      } else {
        throw Exception('Failed to load album');
      }
    } finally {
      getLocationusingIpaddress(currentIpAddress.value);
    }
  }

  //-------------------------------------------------------------//
  //-------------get Location using IP Address-------------------//
  getLocationusingIpaddress(String ipaddress) async {
    var result;
    try {
      final response =
          await http.get(Uri.parse('https://ipinfo.io/${ipaddress}/geo'));
      if (response != null) {
        result = jsonDecode(response.body);
        log("$result");
        currentLocation.value = result['region'];
      } else {
        throw Exception('Failed to load album');
      }
    } finally {
      getCurrentWeather(currentLocation.value);
    }
  }

  getCurrentWeather(String location) async {
    try {
      final response = await http.get(Uri.parse(
          'http://api.weatherapi.com/v1/current.json?key=c0dbb6f1794640eeabf103014222805&q=${location}&aqi=no'));
      log("${jsonDecode(response.body)}");
      if (response != null) {
        currenttemperature.value =
            CurrentWeather.fromJson(jsonDecode(response.body));
        log("$currenttemperature");
      } else {
        throw Exception('Failed to load album');
      }
    } finally {
      Get.toNamed(RouteManager.dashboard);
    }
  }
}
