import 'package:flutter_template/config/config.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/features/debug/screen/debug_screen/debug_screen.dart';
import 'package:push_notification/push_notification.dart';

/// Service to work with [DebugScreen].
class DebugScreenService {
  final PushHandler _pushHandler;

  /// Create an instance [DebugScreenService].
  DebugScreenService(this._pushHandler);

  /// Method for showing push notification from the [DebugScreen].
  void showDebugScreenNotification() {
    if (Environment<Config>.instance().isDebug) {
      _pushHandler.handleMessage(
        <String, Object>{
          'notification': {
            'title': 'Open debug screen',
            'body': '',
          },
          'event': 'debug',
          'data': {
            'event': 'debug',
          },
        },
        MessageHandlerType.onMessage,
        localNotification: true,
      );
    }
  }
}
