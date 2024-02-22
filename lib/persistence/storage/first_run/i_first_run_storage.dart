/// {@template i_first_run_storage.class}
/// Repository interface for working with first app status.
/// {@endtemplate}
abstract class IFirstRunStorage {
  /// Returns is it first app run.
  bool getIsFirstRun();

  /// Save first run app.
  Future<void> setIsFirstRun({required bool value});
}
