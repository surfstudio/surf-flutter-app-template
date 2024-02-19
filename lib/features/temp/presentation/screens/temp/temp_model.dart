import 'package:elementary/elementary.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/features/common/service/theme/theme_service.dart';
import 'package:flutter_template/features/temp/domain/repositories/i_temp_repository.dart';
import 'package:flutter_template/features/temp/presentation/screens/temp/temp_screen.dart';

/// Model for [TempScreen].
final class TempModel extends ElementaryModel implements ITempModel {
  final Environment _environment;
  final IThemeService _themeService;

  // ignore: unused_field
  final ITempRepository _templateRepository;

  @override
  bool get isDebugMode => !_environment.isRelease;

  /// Create an instance [TempModel].
  TempModel(this._environment, this._themeService, this._templateRepository);

  @override
  void switchTheme() {
    _themeService.switchTheme();
  }
}

/// Interface for [TempModel].
abstract class ITempModel extends ElementaryModel {
  /// Return value for app environment status.
  bool get isDebugMode;

  /// Switch theme mode between light and dark.
  void switchTheme();
}
