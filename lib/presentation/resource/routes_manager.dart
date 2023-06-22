import 'package:acourse/presentation/resource/color_manager.dart';
import 'package:acourse/presentation/resource/string_manager.dart';
import 'package:acourse/presentation/resource/styles_manager.dart';
import 'package:acourse/presentation/screens/forgot_password/forgot_password_view.dart';
import 'package:acourse/presentation/screens/login/login_view.dart';
import 'package:acourse/presentation/screens/register/register_view.dart';
import 'package:acourse/presentation/screens/splash/splash_view.dart';
import 'package:acourse/presentation/screens/store_details/store_details_view.dart';
import 'package:flutter/material.dart';

import '../screens/main/main_view.dart';
import '../screens/onboarding/onboarding_view.dart';

class Routes
{
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String mainRoute = '/main';
  static const String onBoardingRoute = '/onBoarding';
  static const String storeDetailsRoute = '/storeDetails';
}

class RouteGenerator
{
  static Route<dynamic> getRoute(RouteSettings? settings)
  {
    switch (settings!.name)
    {
      case Routes.splashRoute : return MaterialPageRoute(builder: (_)=>const SplashView());
      case Routes.loginRoute : return MaterialPageRoute(builder: (_)=> const LoginView());
      case Routes.registerRoute : return MaterialPageRoute(builder: (_)=> const RegisterView());
      case Routes.forgotPasswordRoute : return MaterialPageRoute(builder: (_)=> const ForgotPasswordView());
      case Routes.mainRoute : return MaterialPageRoute(builder: (_)=>const MainView());
      case Routes.storeDetailsRoute : return MaterialPageRoute(builder: (_)=>const StoreDetailsView());
      case Routes.onBoardingRoute : return MaterialPageRoute(builder: (_)=>const OnBoardingView());

      default: return getUnDefinededRoute();
    }
  }

  static Route<dynamic> getUnDefinededRoute()
  {
    return MaterialPageRoute(builder: (_)=>Scaffold(
      appBar: AppBar(
        title: const Text(
          StringsManager.unDefinededRoute
        ),
      ),
      body: Center(
        child: Text(
          StringsManager.unDefinededRoute,
          style: getBoldStyle(color: ColorManager.grey),
        ),
      ),
    ));
  }
}