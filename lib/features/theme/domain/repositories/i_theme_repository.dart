import 'package:flutter/material.dart';
import 'package:flutter_template/features/theme/data/repositories/theme_repository.dart';

/// Interface for [ThemeRepository].
///
/// This repository is used to interact with the theme mode storage.
abstract interface class IThemeRepository {
  /// Set theme mode.
  Future<void> setThemeMode(ThemeMode newThemeMode);

  /// Get theme mode>
  Future<ThemeMode?> getThemeMode();
}
