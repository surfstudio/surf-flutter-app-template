// TODO(init-project): add server urls

/// Server url
enum Url {
  /// dev url
  dev('https://example.com/'),

  /// qa url
  qa('https://example.com/'),

  /// prod url
  prod('https://example.com/');

  /// Url value
  final String value;

  const Url(this.value);
}
