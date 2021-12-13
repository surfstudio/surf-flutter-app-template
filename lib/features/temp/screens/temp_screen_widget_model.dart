import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/app/di/i_app_scope.dart';
import 'package:flutter_template/features/app/domain/app_coordinate.dart';
import 'package:flutter_template/features/temp/screens/temp_screen.dart';
import 'package:flutter_template/features/temp/screens/temp_screen_model.dart';
import 'package:provider/provider.dart';

/// Factory for [TempScreenWidgetModel].
TempScreenWidgetModel initScreenWidgetModelFactory(
  BuildContext context,
) {
  final model = TempScreenModel();
  return TempScreenWidgetModel(model);
}

/// Widget model for [TempScreen].
class TempScreenWidgetModel extends WidgetModel<TempScreen, TempScreenModel>
    implements IDebugWidgetModel {
  /// Create an instance [TempScreenWidgetModel].
  TempScreenWidgetModel(TempScreenModel model) : super(model);

  ///
  void openDebugScreen() {
    final appDependencies = context.read<IAppScope>();
    appDependencies.coordinator.navigate(context, AppCoordinate.debugScreen);
  }
}

/// Interface of [TempScreenWidgetModel].
abstract class IDebugWidgetModel extends IWidgetModel {}
