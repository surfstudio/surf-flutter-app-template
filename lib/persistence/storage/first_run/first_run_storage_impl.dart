import 'package:flutter_template/persistence/storage/first_run/first_run_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Repository for working with first app status
class FirstRunStorageImpl implements IFirstRunStorage {
  /// First run app key
  static const _firstRunAppKey = 'first_run';
  final SharedPreferences _prefs;

  /// Create an instance [FirstRunStorageImpl]
  const FirstRunStorageImpl(this._prefs);

  @override
  bool getIsFirstRun() {
    return _prefs.getBool(_firstRunAppKey) ?? true;
  }

  @override
  Future<void> setIsFirstRun({required bool value}) async {
    await _prefs.setBool(_firstRunAppKey, value);
  }
}
