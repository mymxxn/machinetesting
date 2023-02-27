import 'package:get/get.dart';
import 'package:machinetest/view/Dashboard/dashboard_screen.dart';
import 'package:machinetest/view/Splash%20Screen/splash_screen.dart';

class RouteManager {
  static const String splash = '/splash';
  static const String dashboard = '/dashboard';

  List<GetPage> _routes = [
    GetPage(
      name: '/splash',
      page: () => SplashScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: '/dashboard',
      page: () => DashboardScreen(),
      transition: Transition.cupertino,
    ),
  ];

  get routes => _routes;
}
