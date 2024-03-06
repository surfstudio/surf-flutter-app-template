/// App build type.
/// When building from the CLI, they are governed by the.
/// Assembly from the corresponding file main-\***.dart.
/// ```
///   flutter build *** -t lib/main-***.dart
/// ```
///
enum BuildType {
  /// Dev build type.
  dev,

  /// Prod build type.
  prod,
}
