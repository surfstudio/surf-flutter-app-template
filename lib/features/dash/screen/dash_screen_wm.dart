import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/dash/screen/dash_screen_export.dart';

/// Factory for [DashScreenWidgetModel].
DashScreenWidgetModel defaultDashScreenWidgetModelFactory(
  BuildContext context,
) {
  final model = DashScreenModel();
  return DashScreenWidgetModel(model);
}

/// Widget model for [DashScreen].
class DashScreenWidgetModel extends WidgetModel<DashScreen, DashScreenModel>
    implements IDashScreenWidgetModel {
  /// Create an instance [DashScreenWidgetModel].
  DashScreenWidgetModel(DashScreenModel model) : super(model);
}

/// Interface of [IDashScreenWidgetModel].
abstract class IDashScreenWidgetModel extends IWidgetModel {}
