// TODO(init-project): Add server urls.

/// Server url.
enum Url {
  /// Dev url.
  dev('https://example.com/'),

  /// Prod url.
  prod('https://example.com/');

  /// Url value.
  final String value;

  const Url(this.value);
}
