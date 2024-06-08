import 'dart:math';

import 'package:fasn_ecommerce/features/auth/presentation/views/login_view.dart';
import 'package:fasn_ecommerce/features/auth/presentation/views/signup_view.dart';
import 'package:fasn_ecommerce/features/category/presentation/views/category_view.dart';
import 'package:fasn_ecommerce/features/category/presentation/views/prodect_of_category.dart';
import 'package:fasn_ecommerce/features/category/presentation/views/product_details_view.dart';
import 'package:fasn_ecommerce/features/home/presentaion/views/main_view.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/views/about_us_view.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/views/add_fead_back_view.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/views/common_question_view.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/views/my_order_view.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/views/my_orders_details.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/views/profile_view.dart';
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
      case CategoryView.routeName:
        final category = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => CategoryView(
            categoryList: category,
          ),
        );
      case ProductsOfCategory.routeName:
        final categoryId = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => ProductsOfCategory(
            categoryId: categoryId,
          ),
        );
      case ProductDetailsView.routeName:
        final product = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => ProductDetailsView(
                  product: product,
                ));

      case QummanQustionPage.routeName:
        final commonQuestion = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => QummanQustionPage(
                  commonQuestio: commonQuestion,
                ));
      case AboutUsView.routeName:
        return MaterialPageRoute(builder: (context) => const AboutUsView());
      case AddFeadbackView.routeName:
        return MaterialPageRoute(builder: (context) => const AddFeadbackView());
      case ProfileView.routeName:
        return MaterialPageRoute(builder: (context) => const ProfileView());
      case MyOrderView.routeName:
        return MaterialPageRoute(builder: (context) => const MyOrderView());
      case MyOrderDetails.routeName:
        final orderId = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => MyOrderDetails(id: orderId),
        );
    }

    return null;
  }
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(
      debugLabel: 'key${Random().nextInt(999999999)}');
  static BuildContext get context => AppNavigator.navigatorKey.currentContext!;
}
