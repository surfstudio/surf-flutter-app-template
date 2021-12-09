import 'package:flutter_template/features/debug/domain/factory/push_strategy_factory.dart';
import 'package:flutter_template/features/debug/screen/debug_screen/debug_screen.dart';
import 'package:flutter_template/features/debug/service/debug_screen_service.dart';
import 'package:flutter_template/features/debug/service/messaging_service.dart';
import 'package:push_notification/push_notification.dart';
import 'package:surf_logger/surf_logger.dart';

/// Factory to create [DebugScreenScope].
DebugScreenScope debugScreenFactory() {
  return DebugScreenScope();
}

/// Scope of dependencies the debug screen needs.
class DebugScreenScope implements IDebugScreen {
  @override
  late final debugScreenService = DebugScreenService(_pushHandler);

  late final _pushStrategyFactory = PushStrategyFactory();
  late final _notificationController = NotificationController(() {
    Logger.d('permission declined');
  });
  late final _messagingService = MessagingService();

  late final _pushHandler = PushHandler(
    _pushStrategyFactory,
    _notificationController,
    _messagingService,
  );
}

/// Debug screen dependencies.
abstract class IDebugScreen {
  /// Service to work with [DebugScreen].
  DebugScreenService get debugScreenService;
}
