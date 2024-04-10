# Authentication

The guide describes token-based authentication which relies on **access** and **refresh** tokens.

## Fresh

The recommended approach is to use the `fresh` package.

[**Fresh**](https://pub.dev/packages/fresh) is a token refresh library for dart. This library consists of a collection of packages which specialize in a particular aspect of token refresh.

Project contains preconfigured classes for `fresh_dio` package to make its usage even more easier.

Example:
```dart
final fresh = Fresh<AuthTokenPair>(
  tokenHeader: (token) => {'Authorization': 'Bearer ${token.accessToken}'},
  tokenStorage: const TokenStorageImpl(FlutterSecureStorage()),
  refreshToken: (options, handler) async { ... },
);

// Add interceptor to Dio instance.
dio.interceptors.add(fresh);

// Listen to authentication status changes.
fresh.authenticationStatus.listen((status) { ... });

// Set token.
fresh.setToken(token);

// Clear token.
fresh.clearToken();
```
## Token Storage

`TokenStorageImpl` is an implementation of `TokenStorage<AuthTokenPair>` from `fresh` package which relies on `flutter_secure_storage`.

## Auth Tokens

`AuthTokenPair` is a class that represents a pair of access and refresh tokens. It is used by `TokenStorageImpl`.
