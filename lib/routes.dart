import 'package:vrit_task/home.dart';
import 'package:vrit_task/qr.dart';

class AppRoute {
  AppRoute._();
  static const String homeRoute = '/';
  static const String qrRoute = '/qr';

  static getAppRoutes() => {
        homeRoute: (context) => const HomePage(),
        qrRoute: (context) => const QrView(),
      };
}
