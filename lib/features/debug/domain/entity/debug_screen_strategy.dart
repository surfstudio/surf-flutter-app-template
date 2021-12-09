import 'package:flutter/material.dart';
import 'package:flutter_template/features/app/service/app_coordinate.dart';
import 'package:flutter_template/features/app/service/coordinator.dart';
import 'package:flutter_template/features/debug/domain/entity/debug_push_message.dart';
import 'package:flutter_template/features/debug/screen/debug_screen/debug_screen.dart';
import 'package:push_notification/push_notification.dart';

/// [DebugScreen] strategy.
/// Needed to send push notifications.
class DebugScreenStrategy extends PushHandleStrategy<DebugPushMessage> {
  @override
  bool get ongoing => _ongoing;

  @override
  set ongoing(bool ongoing) {
    _ongoing = ongoing;
  }

  @override
  bool get playSound => _playSound;

  @override
  set playSound(bool playSound) {
    _playSound = playSound;
  }

  bool _ongoing = true;

  bool _playSound = false;

  /// Create an instance [DebugPushMessage].
  DebugScreenStrategy(DebugPushMessage payload) : super(payload);

  @override
  void onBackgroundProcess(Map<String, dynamic> message) {
    // ignore: avoid_print
    print('notification background process ${message.toString()}');
  }

  @override
  void onTapNotification(NavigatorState? navigator) {
    throw UnimplementedError('Method not suitable for current implementation');
  }

  void onTap(BuildContext context, Coordinator coordinator) =>
      coordinator.navigate(context, AppCoordinate.debugScreen);
}
