import 'package:flutter_template/config/debug_options.dart';

/// Application configuration.
class AppConfig {
  /// Server url.
  final String url;

  /// Proxy url.
  final String? proxyUrl;

  /// Additional application settings in debug mode.
  final DebugOptions debugOptions;

  /// Create an instance [AppConfig].
  AppConfig({
    required this.url,
    required this.debugOptions,
    this.proxyUrl,
  });

  /// Create an instance [AppConfig] with modified parameters.
  AppConfig copyWith({
    String? url,
    String? proxyUrl,
    DebugOptions? debugOptions,
  }) =>
      AppConfig(
        url: url ?? this.url,
        proxyUrl: proxyUrl ?? this.proxyUrl,
        debugOptions: debugOptions ?? this.debugOptions,
      );
}
