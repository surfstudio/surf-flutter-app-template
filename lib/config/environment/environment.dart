import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_template/config/environment/build_types.dart';
import 'package:flutter_template/config/url.dart';

/// Environment configuration.
/// Only static configurations that are known at compile time are allowed here.
class Environment {
  static Environment? _instance;

  /// Build type.
  final BuildType buildType;

  /// Firebase options for initialize.
  final FirebaseOptions? firebaseOptions;

  /// Is this application running in dev mode.
  bool get isDev => buildType == BuildType.dev;

  /// Is this application running in qa mode.
  bool get isQa => buildType == BuildType.qa;

  /// Is this application running in prod mode.
  bool get isProd => buildType == BuildType.prod;

  Environment._(
    this.buildType,
    this.firebaseOptions,
  );

  /// Provides instance [Environment].
  factory Environment.instance() => _instance!;

  /// Initializing the environment.
  static void init({
    required BuildType buildType,
    FirebaseOptions? firebaseOptions,
  }) {
    _instance ??= Environment._(
      buildType,
      firebaseOptions,
    );
  }
}

/// [BuildType] extension for default url.
extension BuildTypeX on BuildType {
  /// Default url for build type.
  String get defaultUrl => switch (this) {
        BuildType.dev => Url.devUrl,
        BuildType.qa => Url.qaUrl,
        BuildType.prod => Url.prodUrl,
      };
}
