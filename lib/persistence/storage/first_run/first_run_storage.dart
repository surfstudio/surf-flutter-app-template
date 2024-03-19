import 'package:flutter_template/persistence/storage/first_run/i_first_run_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template first_run_storage.class}
/// Repository for working with first app status.
/// {@endtemplate}
class FirstRunStorage implements IFirstRunStorage {
  final SharedPreferences _prefs;

  /// Create an instance [FirstRunStorage].
  /// {@macro first_run_storage.class}
  const FirstRunStorage(this._prefs);

  @override
  bool getIsFirstRun() {
    return _prefs.getBool(FirstRunStorageKeys.firstRun.keyName) ?? true;
  }

  @override
  Future<void> setIsFirstRun({required bool value}) => _prefs.setBool(FirstRunStorageKeys.firstRun.keyName, value);
}

/// Keys for [FirstRunStorage].
enum FirstRunStorageKeys {
  /// @nodoc.
  firstRun('first_run');

  /// Key Name.
  final String keyName;

  const FirstRunStorageKeys(this.keyName);
}
