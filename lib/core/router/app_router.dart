import 'package:fasn_ecommerce/features/splash/presentaion/views/splash_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
 static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.routeName:
        return MaterialPageRoute(builder: (context) => const SplashView());
    }
    return null;
  }
}
