import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  static const String routeName = '/';
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).title,
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
