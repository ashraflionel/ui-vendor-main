import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/home_page.dart';
import 'package:flutter_application_1/Pages/login_page.dart';
import 'package:flutter_application_1/Pages/otp_page.dart';


class AppRoute {
  static const homepage = '/home';
  static const loginpage = '/login';
  static const otppage = '/otp';

  static Route<Object>? generateRoute(RouteSettings settings) {
    var args = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case homepage:
        return MaterialPageRoute(builder: (_) => const HomePage(), settings: settings);
      case loginpage:
        return MaterialPageRoute(builder: (_) => const LoginPage(), settings: settings);
      case otppage:
        return (args != null)
            ? MaterialPageRoute(
                builder: (_) => OtpPage(
                      phoneNumber: args["phoneNumber"],
                      countryCode: args["countryCode"],
                    ),
                settings: settings)
            : null;
      default:
        return null;
    }
  }
}
