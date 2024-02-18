import 'package:flutter/material.dart';
import 'package:flutter_template/assets/text/text_extention.dart';
import 'package:flutter_template/uikit/colors/color_scheme.dart';

extension ThemeDataExt on ThemeData {
  AppColorScheme get colorScheme =>
      extension<AppColorScheme>() ?? (throw Exception('no AppColorScheme'));

  AppTextTheme get textTheme => extension<AppTextTheme>() ?? (throw Exception('no AppTextTheme'));
}
