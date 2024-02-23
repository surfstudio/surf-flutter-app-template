import 'package:flutter/material.dart';
import 'package:flutter_template/uikit/colors/app_color_scheme.dart';
import 'package:flutter_template/uikit/text/app_text_scheme.dart';

extension ThemeDataExt on ThemeData {
  AppColorScheme get colorScheme =>
      extension<AppColorScheme>() ?? (throw Exception('no AppColorScheme'));

  AppTextScheme get textScheme =>
      extension<AppTextScheme>() ?? (throw Exception('no AppTextScheme'));
}
