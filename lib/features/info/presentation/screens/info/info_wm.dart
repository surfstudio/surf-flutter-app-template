import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/mixin/theme_mixin.dart';
import 'package:flutter_template/features/info/presentation/screens/info/info_model.dart';
import 'package:flutter_template/features/info/presentation/screens/info/info_screen.dart';

/// Factory for [InfoWidgetModel].
InfoWidgetModel infoScreenWmFactory(
  // ignore: avoid-unused-parameters
  BuildContext context,
) {
  final model = InfoModel();

  return InfoWidgetModel(model);
}

/// Widget model for [InfoScreen].
class InfoWidgetModel extends WidgetModel<InfoScreen, InfoModel>
    with ThemeWMMixin
    implements IInfoWidgetModel {
  /// Create an instance [InfoWidgetModel].
  InfoWidgetModel(super._model);
}

/// Interface for [InfoWidgetModel].
abstract interface class IInfoWidgetModel with ThemeIModelMixin implements IWidgetModel {}
