import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/app/di/i_app_scope.dart';
import 'package:flutter_template/features/app/domain/app_coordinate.dart';
import 'package:flutter_template/features/temp/screens/init_screen.dart';
import 'package:flutter_template/features/temp/screens/init_screen_model.dart';
import 'package:provider/provider.dart';

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

  ///
  void openDebugScreen() {
    final appDependencies = context.read<IAppScope>();
    appDependencies.coordinator.navigate(context, AppCoordinate.debugScreen);
  }
}

/// Interface of [InitScreenWidgetModel].
abstract class IDebugWidgetModel extends IWidgetModel {}
