import 'package:flutter/material.dart';
import 'package:acourse/presentation/resource/font_manager.dart';

TextStyle _getTextStyles(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontFamily: FontConstants.fontFamily,
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: color,
  );
}

//light Style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyles(fontSize, FontWeightManager.light, color);
}

//regular Style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyles(fontSize, FontWeightManager.regular, color);
}

//medium Style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyles(fontSize, FontWeightManager.medium, color);
}

//semi bold Style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyles(fontSize, FontWeightManager.semiBold, color);
}

//bold Style

TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyles(fontSize, FontWeightManager.bold, color);
}
