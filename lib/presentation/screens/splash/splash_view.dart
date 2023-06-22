import 'dart:async';

import 'package:acourse/presentation/resource/color_manager.dart';
import 'package:acourse/presentation/resource/constants_manager.dart';
import 'package:acourse/presentation/resource/image_assets_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  startDelay()
  {
    _timer= Timer(Duration(seconds: ConstantsManager.splashDelay), () { });
  }
  @override
  void initState() {
    super.initState();
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
}
