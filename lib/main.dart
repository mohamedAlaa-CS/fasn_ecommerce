import 'dart:developer';

import 'package:fasn_ecommerce/core/di/injections.dart';
import 'package:fasn_ecommerce/core/router/app_router.dart';
import 'package:fasn_ecommerce/core/utils/local_data.dart';
import 'package:fasn_ecommerce/features/home/presentaion/manager/main_cubit/main_cubit.dart';
import 'package:fasn_ecommerce/features/splash/presentaion/views/splash_view.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await nitInj();
  runApp(BlocProvider(
    create: (context) => MainCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        log(LocalData.token.toString());
        return MaterialApp(
          locale: Locale(MainCubit.get(context).currentLanguage),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: SplashView.routeName,
          navigatorKey: AppNavigator.navigatorKey,
        );
      },
    );
  }
}
