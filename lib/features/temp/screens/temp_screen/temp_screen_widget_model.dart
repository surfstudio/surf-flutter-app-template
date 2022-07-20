import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/navigation/service/router.dart';
import 'package:flutter_template/features/temp/screens/temp_screen/temp_screen.dart';
import 'package:flutter_template/features/temp/screens/temp_screen/temp_screen_model.dart';
import 'package:provider/provider.dart';

/// Factory for [TempScreenWidgetModel].
TempScreenWidgetModel initScreenWidgetModelFactory(
  BuildContext context,
) {
  final model = TempScreenModel();
  return TempScreenWidgetModel(model, context.read<IAppScope>().router);
}

/// Widget model for [TempScreen].
class TempScreenWidgetModel extends WidgetModel<TempScreen, TempScreenModel> implements IDebugWidgetModel {
  /// Create an instance [TempScreenWidgetModel].

  final AppRouter _router;
  TempScreenWidgetModel(TempScreenModel model, this._router) : super(model);

  void navigate() {
    _router.pushNamed('/counter');
  }
}

/// Interface of [TempScreenWidgetModel].
abstract class IDebugWidgetModel extends IWidgetModel {}
