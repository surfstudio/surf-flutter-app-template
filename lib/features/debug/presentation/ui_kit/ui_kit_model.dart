import 'package:flutter_template/core/architecture/presentation/base_model.dart';
import 'package:flutter_template/features/debug/presentation/ui_kit/ui_kit_screen.dart';
import 'package:flutter_template/features/shared/domain/repositories/i_permission_handler_repository.dart';
import 'package:permission_handler/permission_handler.dart';

/// {@template ui_kit_model.class}
/// Model for [UiKitScreen].
/// {@endtemplate}
final class UiKitModel extends BaseModel {
  final IPermissionHandlerRepository _permissionHandlerRepository;

  /// {@macro ui_kit_model.class}
  UiKitModel({
    required super.logWriter,
    required IPermissionHandlerRepository permissionHandlerRepository,
  }) : _permissionHandlerRepository = permissionHandlerRepository;

  ///
  Future<PermissionResult> checkPermission(Permission permission) =>
      _permissionHandlerRepository.checkPermission(permission);
}
