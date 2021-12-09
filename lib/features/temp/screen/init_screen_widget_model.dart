import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/temp/screen/init_screen.dart';
import 'package:flutter_template/features/temp/screen/init_screen_model.dart';

/// Factory for [InitScreenWidgetModel].
InitScreenWidgetModel initScreenWidgetModelFactory(
  BuildContext context,
) {
  final model = InitScreenModel();
  return InitScreenWidgetModel(model);
}

/// Widget model for [InitScreen].
class InitScreenWidgetModel extends WidgetModel<InitScreen, InitScreenModel>
    implements IDebugWidgetModel {
  /// Create an instance [InitScreenWidgetModel].
  InitScreenWidgetModel(InitScreenModel model) : super(model);
}

/// Interface of [InitScreenWidgetModel].
abstract class IDebugWidgetModel extends IWidgetModel {}
