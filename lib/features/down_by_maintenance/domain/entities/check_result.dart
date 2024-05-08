/// Server check result enum.
enum ServerCheckResult {
  /// Server works normally.
  worksNormally,
  /// Server is not active.
  notActive,
  /// Error occurred during server check.
  errorOccurred,
  /// Server check is in progress.
  processing,
}
