import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:random_quote_clean_architecture_bloc_app/config/routes/app_routes.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/utils/app_colors.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/utils/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _goNext() => Navigator.pushReplacementNamed(context, Routes.randomQuoteRoute);

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 3000), () => _goNext());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              ImageAssets.quote,
              color: AppColors.primary,
            ),
          ),
          SpinKitFadingCircle(
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
