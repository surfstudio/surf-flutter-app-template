import 'package:flutter_template/config/debug_options.dart';

/// Application configuration.
class Config {
  /// Server url.
  final String url;

  /// Proxy url.
  final String? proxyUrl;

  /// Additional application settings in debug mode.
  final DebugOptions debugOptions;

  /// Create an instance [Config].
  Config({
    required this.url,
    required this.debugOptions,
    this.proxyUrl,
  });

  /// Create an instance [Config] with modified parameters.
  Config copyWith({
    String? url,
    String? proxyUrl,
    DebugOptions? debugOptions,
  }) =>
      Config(
        url: url ?? this.url,
        proxyUrl: proxyUrl ?? this.proxyUrl,
        debugOptions: debugOptions ?? this.debugOptions,
      );
}
