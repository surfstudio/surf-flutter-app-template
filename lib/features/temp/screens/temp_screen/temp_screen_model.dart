import 'package:elementary/elementary.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/features/common/service/theme/theme_service.dart';
import 'package:flutter_template/features/temp/screens/temp_screen/temp_screen.dart';

/// Model for [TempScreen].
class TempScreenModel extends ElementaryModel implements ITempScreenModel {
  final Environment _environment;
  final IThemeService _themeService;

  @override
  bool get isDebugMode => !_environment.isRelease;

  /// Create an instance [TempScreenModel].
  TempScreenModel(this._environment, this._themeService);

  @override
  void switchTheme() {
    _themeService.switchTheme();
  }
}

/// Interface of [TempScreenModel].
abstract class ITempScreenModel extends ElementaryModel {
  /// Return value for app environment status
  bool get isDebugMode;

  /// Switch theme mode between light and dark
  void switchTheme();
}
