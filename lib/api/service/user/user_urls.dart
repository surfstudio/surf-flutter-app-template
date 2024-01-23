/// Эндпоинты для User
class UserUrls {
  /// Разрыв связи fcmToken с backend
  static const String discardFcmToken = '/user/discardFcmToken';

  /// Установка связи fcmToken с backend
  static const String fcmToken = '/user/fcmToken';

  /// Получение профиля пользователя
  /// Редактирование профиля пользователя
  static const String profile = '/user/profile';

  const UserUrls._();
}
