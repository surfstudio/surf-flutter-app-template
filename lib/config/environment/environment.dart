import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_template/config/environment/build_types.dart';
import 'package:flutter_template/config/url.dart';

/// {@template environment.class}
/// Environment configuration.
/// Only static configurations that are known at compile time are allowed here.
/// {@endtemplate}
class Environment {
  /// Build type.
  final BuildType buildType;

  /// Firebase options for initialize.
  final FirebaseOptions? firebaseOptions;

  /// {@macro environment.class}
  const Environment({
    required this.buildType,
    this.firebaseOptions,
  });

  /// Is this application running in dev mode.
  bool get isDev => buildType == BuildType.dev;

  /// Is this application running in prod mode.
  bool get isProd => buildType == BuildType.prod;
}

/// [BuildType] extension for default url.
extension BuildTypeX on BuildType {
  /// Default url for build type.
  Url get defaultUrl => switch (this) {
        BuildType.dev => Url.dev,
        BuildType.prod => Url.prod,
      };
}
