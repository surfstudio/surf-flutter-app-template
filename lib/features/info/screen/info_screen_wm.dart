import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/assets/colors/color_scheme.dart';
import 'package:flutter_template/features/info/screen/info_screen.dart';
import 'package:flutter_template/features/info/screen/info_screen_model.dart';

/// Factory for [InfoScreenWidgetModel].
InfoScreenWidgetModel infoScreenWmFactory(
  BuildContext context,
) {
  final model = InfoScreenModel();
  return InfoScreenWidgetModel(model);
}

/// Widget model for [InfoScreen].
class InfoScreenWidgetModel extends WidgetModel<InfoScreen, InfoScreenModel>
    implements IInfoScreenWidgetModel {
  @override
  AppColorScheme get colorScheme => AppColorScheme.of(context);

  /// Create an instance [InfoScreenWidgetModel].
  InfoScreenWidgetModel(InfoScreenModel model) : super(model);
}

/// Interface of [InfoScreenWidgetModel].
abstract class IInfoScreenWidgetModel extends IWidgetModel {
  /// App color scheme.
  AppColorScheme get colorScheme;
}
