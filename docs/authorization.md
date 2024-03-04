# Authorization

To implement authorization, follow these steps:

### 1. Generate the API level.

The `lib/api` folder is intended for API files.

### 2. Prepare entities and converters.

A converter - `Converter` is used for data mapping. 

Example:
```dart
/// tokens_entity_converter.dart
/// Converter for [TokensEntity]
typedef ITokensEntityConverter = Converter<TokensEntity, TokensData>;

/// {@template tokens_entity_converter.class}
/// Implementation [ITokensEntityConverter]
/// {@endtemplate}
final class TokensEntityConverter extends ITokensEntityConverter {
  /// {@macro tokens_entity_converter.class}
  const TokensEntityConverter();

  @override
  TokensEntity convert(TokensData from) {
    return TokensEntity(
      accessToken: from.accessToken,
      refreshToken: from.refreshToken,
    );
  }
}
```

### 3. Implement network error handling.

Create network error classes and implement their mapping in repositories.

### 4. Implement AuthRepository

The project uses AuthRepository for authorization.
Conceptually, this class is the business logic of authentication.

```dart
abstract interface class IAuthRepository {
  /// logout
  RequestOperation<void> logout();
}
```

Depending on the project requirements, add the necessary methods:
* authentication state
* methods for user authorization
* repository initialization
* ...

```dart

abstract interface class IAuthRepository {
  /// Stream with authentication state
  Stream<AuthState> get authState;

  /// Current authentication state
  AuthState get currentAuthState;

  /// Initialize repository
  RequestOperation<void> init();

  /// Get otp-token by phone number
  RequestOperation<OtpTokenEntity> otpToken(String phone);

  /// Verify otp-code.
  /// Successful completion of the request - the user is authorized.
  RequestOperation<UserProfileEntity> verifyOtp(String otpToken, String otpCode);

  /// logout
  RequestOperation<void> logout();

  /// Dispose resources
  void dispose();
  RequestOperation<void> logout();
}

```
In the **initialization method**, you can perform a check for the first launch of the application,
and it is also recommended to perform a cleanup `_tokensStorage.clear()` to avoid problems when reinstalling
the application on **ios**.

```dart
/// Example
Future<void> _checkFirstRun() async {
    final isFirstRun = _firstRunStorage.getIsFirstRun();

    if (isFirstRun) {
      await _firstRunStorage.setIsFirstRun(value: false);

      final result = await logout();
      _handleResultFailure(result);
    }
  }
```
### 5. AuthInterceptor

The `AuthInterceptor` class is designed to handle requests and errors in the Dio library when working with requests
for authorized users.

It contains the following methods:

* **onRequest:** This method is called before each request. It gets the access token and, if the access token
  is missing, rejects the request. If the access token is present, it adds it to the request header.

* **onError:** This method is called when an error occurs. If the error is not related to an invalid status,
  it simply passes it on. If the error is related to an invalid status, the method tries to refresh the tokens
  and retry the request. If the token refresh fails, the `onLogout` callback is called.

* **_retryRequest:** This private method is used to retry the request with new tokens after they are refreshed.
  If the request is successful, it returns the response. If the request fails, it logs the error and returns a failure.


`AuthInterceptor` is fully implemented. It needs to implement `ITokenOperationsService` and `IRefreshTokensRepository`.


### 6. RefreshTokensRepository

Implement the `IRefreshTokensRepository` for interact with the api for working with authorization tokens.


### Classes for authorization

* `AuthInterceptor` - fully implemented
* `TokenOperationsService` - fully implemented
* `RefreshTokensRepository` - needs implement for a specific project
* `TokensStorage` - fully implemented
* `AuthRepository` - needs implement for a specific project
