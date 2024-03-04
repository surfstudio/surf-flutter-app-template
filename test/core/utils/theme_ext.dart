import 'package:flutter/material.dart';
import 'package:flutter_template/uikit/colors/color_scheme.dart';
import 'package:flutter_template/uikit/text/text_extention.dart';

extension ThemeDataExt on ThemeData {
  AppColorScheme get colorScheme =>
      extension<AppColorScheme>() ?? (throw Exception('no AppColorScheme'));

  AppTextTheme get textTheme => extension<AppTextTheme>() ?? (throw Exception('no AppTextTheme'));
}
