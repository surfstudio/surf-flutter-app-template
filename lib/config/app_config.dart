/// Application configuration.
class AppConfig {
  /// Server url.
  final String url;

  /// Proxy url.
  final String? proxyUrl;

  /// Create an instance [AppConfig].
  AppConfig({
    required this.url,
    this.proxyUrl,
  });

  /// Create an instance [AppConfig] with modified parameters.
  AppConfig copyWith({
    String? url,
    String? proxyUrl,
  }) =>
      AppConfig(
        url: url ?? this.url,
        proxyUrl: proxyUrl ?? this.proxyUrl,
      );
}
