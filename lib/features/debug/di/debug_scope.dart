import 'package:flutter/cupertino.dart';
import 'package:flutter_template/common/utils/disposable_object/disposable_object.dart';
import 'package:flutter_template/common/utils/disposable_object/i_disposable_object.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/debug/data/converters/url_converter.dart';
import 'package:flutter_template/features/debug/data/repositories/debug_repository.dart';
import 'package:flutter_template/features/debug/domain/repositories/i_debug_repository.dart';
import 'package:flutter_template/persistence/storage/config_storage/config_storage_impl.dart';
import 'package:provider/provider.dart';

/// {@template debug_scope.class}
/// Dependencies scope of Debug module.
/// {@endtemplate}
final class DebugScope extends DisposableObject implements IDebugScope {
  @override
  final IDebugRepository debugRepository;

  /// Factory constructor for [DebugScope].
  factory DebugScope.create(BuildContext context) {
    final appScope = context.read<IAppScope>();

    return DebugScope(
      DebugRepository(
        configStorage: ConfigStorageImpl(appScope.sharedPreferences),
        urlConverter: const UrlConverter(),
      ),
    );
  }

  /// {@macro debug_scope.class}
  DebugScope(this.debugRepository);
}

/// Interface for Debug DI Scope.
abstract interface class IDebugScope implements IDisposableObject {
  /// Debug repository.
  abstract final IDebugRepository debugRepository;
}
