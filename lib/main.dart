import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest/Utils/Route%20Manager/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Machine test',
      debugShowCheckedModeBanner: false,
      initialRoute: RouteManager().routes[0].name,
      getPages: RouteManager().routes,
    );
  }
}
