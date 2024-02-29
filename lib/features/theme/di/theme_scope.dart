import 'package:flutter/material.dart';
import 'package:flutter_template/common/utils/disposable_object/disposable_object.dart';
import 'package:flutter_template/common/utils/disposable_object/i_disposable_object.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/theme/data/repositories/theme_repository.dart';
import 'package:flutter_template/features/theme/domain/repositories/i_theme_repository.dart';
import 'package:flutter_template/persistence/storage/theme_storage/theme_storage_impl.dart';
import 'package:provider/provider.dart';

/// Scope dependencies of the Theme feature
abstract interface class IThemeScope implements IDisposableObject {
  /// ThemeRepository
  IThemeRepository get repository;
}

/// {@template theme_scope.class}
/// Implementation of [IThemeScope]
/// {@endtemplate}
final class ThemeScope extends DisposableObject implements IThemeScope {
  @override
  late final IThemeRepository repository;

  /// Factory constructor for [IThemeScope]
  factory ThemeScope.create(BuildContext context) {
    final appScope = context.read<IAppScope>();
    final storage = ThemeModeStorageImpl(appScope.sharedPreferences);
    final repository = ThemeRepository(themeModeStorage: storage);

    return ThemeScope(repository);
  }

  /// {@macro theme_scope.class}
  ThemeScope(this.repository);
}
