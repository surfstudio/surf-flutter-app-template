import 'package:flutter_template/features/debug/domain/entity/debug_push_message.dart';
import 'package:flutter_template/features/debug/domain/entity/debug_screen_strategy.dart';
import 'package:push_notification/push_notification.dart';

/// Factory for push notification strategies[DebugScreenStrategy].
class PushStrategyFactory extends PushHandleStrategyFactory {
  @override
  Map<String, StrategyBuilder> get map => {
        'debug': (payload) {
          final message = DebugPushMessage.fromMap(payload);
          return DebugScreenStrategy(message);
        },
      };

  @override
  DebugScreenStrategy Function(Map<String, dynamic> payload)
      get defaultStrategy => (payload) {
            final message = DebugPushMessage.fromMap(payload);
            return DebugScreenStrategy(message);
          };
}
