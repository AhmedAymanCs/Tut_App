import 'dart:async';

import 'package:acourse/presentation/resource/color_manager.dart';
import 'package:acourse/presentation/resource/constants_manager.dart';
import 'package:acourse/presentation/resource/image_assets_manager.dart';
import 'package:flutter/material.dart';

import '../../resource/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay()
  {
    _timer= Timer( const Duration(seconds: ConstantsManager.splashDelay),() {
      _goNext();
    });
  }
  _goNext()
  {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }
  @override
  void initState() {
    super.initState();
    _startDelay();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(
        child:Image(image: AssetImage(AssetsImageManager.splashLogo)),
      ),

    );
  }


  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
