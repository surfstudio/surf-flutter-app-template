import 'package:elementary/elementary.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/features/temp/screens/temp_screen/temp_screen.dart';

/// Model for [TempScreen].
class TempScreenModel extends ElementaryModel implements ITempScreenModel {
  final Environment _environment;

  @override
  bool get isDebugMode => !_environment.isRelease;

  /// Create an instance [TempScreenModel].
  TempScreenModel(this._environment);
}

/// Interface of [TempScreenModel].
abstract class ITempScreenModel extends ElementaryModel {
  /// Return value for app environment status
  bool get isDebugMode;
}
