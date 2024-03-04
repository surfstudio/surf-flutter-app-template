import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/core/architecture/presentation/base_model.dart';
import 'package:flutter_template/features/temp/domain/repositories/i_temp_repository.dart';
import 'package:flutter_template/features/temp/presentation/screens/temp/temp_screen.dart';

/// Model for [TempScreen].
final class TempModel extends BaseModel {
  final Environment _environment;

  // ignore: unused_field
  final ITempRepository _templateRepository;

  /// Return value for app environment status.
  bool get isDebugMode => !_environment.isProd;

  /// Create an instance [TempModel].
  TempModel(
    this._environment,
    this._templateRepository, {
    required super.logWriter,
  });
}
