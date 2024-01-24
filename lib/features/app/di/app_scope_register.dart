import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Register and setup third-party dependencies for app DI scope.
class AppScopeRegister {
  /// Create scope.
  Future<AppScope> createScope() async {
    final sharedPreferences = await _createSharedPreferences();

    return AppScope(sharedPreferences);
  }

  Future<SharedPreferences> _createSharedPreferences() => SharedPreferences.getInstance();
}
