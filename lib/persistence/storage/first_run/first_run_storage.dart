/// Repository interface for working with first app status
abstract class IFirstRunStorage {
  /// Returns is it first app run
  bool getIsFirstRun();

  /// Save first run app
  Future<void> setIsFirstRun({required bool value});
}
