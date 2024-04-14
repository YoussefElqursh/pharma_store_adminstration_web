import 'package:flutter/material.dart';
import 'package:pharma_store_administration_web/layouts/home_layout.dart';
import 'package:pharma_store_administration_web/modules/2-forgot_password/reset_password_screen.dart';

import '../../../modules/1-login_screen/login_screen.dart';
import '../../../modules/2-forgot_password/forgot_password_screen.dart';
import '../../../modules/2-forgot_password/otp_screen.dart';
import '../../../modules/2-forgot_password/success_password_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'LoginScreenRoute':
        return LoginScreen.route();
      case 'ForgotPasswordScreenRoute':
        return ForgotPasswordScreen.route();
      case 'OTPScreenRoute':
        return OTPScreen.route();
      case 'ResetPasswordScreenRoute':
        return ResetPasswordScreen.route();
      case 'SuccessPasswordScreenRoute':
        return SuccessPasswordScreen.route();
      case 'HomeScreenRoute':
        return HomeScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
    );
  }
}
