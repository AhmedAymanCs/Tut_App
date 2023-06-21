import 'package:acourse/presentation/resource/color_manager.dart';
import 'package:acourse/presentation/resource/font_manager.dart';
import 'package:acourse/presentation/resource/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:acourse/presentation/resource/styles_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
    primaryColorDark: ColorManager.darkPrimary,
    primaryColorLight: ColorManager.lightPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary, //ripple effect color
    //card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
    //appbar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle:
          getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
    ),
    //button theme
    buttonTheme: ButtonThemeData(
      disabledColor: ColorManager.grey1,
      shape: const StadiumBorder(),
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary,
    ),

    //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: getRegularStyle(
            color: ColorManager.primary,
            fontSize: AppSize.,
          ),
          backgroundColor: ColorManager.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s12))),
    ),

    //text theme
    textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.s16),
        titleMedium: getMediumStyle(
            color: ColorManager.lightGrey, fontSize: FontSize.s14),
        bodySmall: getRegularStyle(color: ColorManager.grey1),
        bodyLarge: getRegularStyle(color: ColorManager.grey),
        headlineLarge:
            getLightStyle(color: ColorManager.white, fontSize: FontSize.s22)
    ),
    // input decoration theme (text form field)
  );
}
