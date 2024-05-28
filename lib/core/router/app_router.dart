import 'package:fasn_ecommerce/features/auth/presentation/views/login_view.dart';
import 'package:fasn_ecommerce/features/auth/presentation/views/signup_view.dart';
import 'package:fasn_ecommerce/features/home/presentaion/views/main_view.dart';
import 'package:fasn_ecommerce/features/splash/presentaion/views/splash_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.routeName:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case LoginPage.routeName:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case SignupView.routeName:
        return MaterialPageRoute(builder: (context) => const SignupView());
      case MainView.routeName:
        return MaterialPageRoute(builder: (context) => const MainView());
    }

    return null;
  }
}
