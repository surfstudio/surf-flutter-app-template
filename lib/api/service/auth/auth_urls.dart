/// Эндпоинты для Auth
class AuthUrls {
  /// Авторизация по коду, получение ОТП кода
  static const String otp = '/otp';

  /// Авторизация по коду, подтверждение ОТП кодом
  static const String verify = '/otp/verify';

  const AuthUrls._();
}
