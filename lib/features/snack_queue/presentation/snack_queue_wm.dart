import 'dart:async';
import 'dart:collection';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy_dialogs/flutter_easy_dialogs.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/navigation/app_router.dart';
import 'package:flutter_template/features/snack_queue/presentation/default_snack_controller.dart';
import 'package:flutter_template/features/snack_queue/presentation/snack_message_type.dart';
import 'package:flutter_template/features/snack_queue/presentation/snack_queue_controller.dart';
import 'package:flutter_template/features/snack_queue/presentation/snack_queue_model.dart';
import 'package:flutter_template/features/snack_queue/presentation/snack_queue_widget.dart';
import 'package:flutter_template/features/snack_queue/presentation/top_snack_bar.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

/// We display a success snack for 4 seconds.
/// We display an error snack indefinitely until the user leaves the screen where the snack is displayed.
/// Any snack can be hidden by swiping up.
const _topSnackDuration = Duration(milliseconds: 4000);

/// DI factory for [SnackQueueWM].
SnackQueueWM defaultSnackQueueWMFactory(BuildContext context) {
  final appScope = context.read<IAppScope>();
  final router = context.read<AppRouter>();

  return SnackQueueWM(
    SnackQueueModel(logWriter: appScope.logger),
    router,
    const DefaultSnackController(),
  );
}

/// Interface for [SnackQueueWM].
abstract interface class ISnackQueueWM implements SnackQueueController, IWidgetModel {}

/// {@template snack_provider_wm.class}
/// [WidgetModel] for [SnackQueueWidget].
/// {@endtemplate}
final class SnackQueueWM extends WidgetModel<SnackQueueWidget, SnackQueueModel> implements ISnackQueueWM {
  /// Controller for displaying dialogs.
  final DefaultSnackController _snackController;

  final AppRouter _router;

  /// Queue of snacks.
  final _snackQueue = Queue<TopSnackBar>();

  /// Stream with snacks.
  late final BehaviorSubject<TopSnackBar> _snackStream;

  final _currentRouterSubject = BehaviorSubject<String>();
  late final StreamSubscription<List<String>> _currentRouterSubscription;

  /// Controller for displaying dialogs.
  Completer<void>? _completer;

  bool _hasOpenedSnack = false;

  /// {@macro snack_provider_wm.class}
  SnackQueueWM(
    super._model,
    this._router,
    this._snackController,
  );

  @override
  Future<void> initWidgetModel() async {
    super.initWidgetModel();

    _router.addListener(_listenRouter);
    _currentRouterSubscription = _currentRouterSubject.pairwise().listen(_currentRouterListener);
    _snackStream = BehaviorSubject<TopSnackBar>()
      // ignore: no-empty-block
      ..stream.asyncMap(_showSnackBarDelayed).listen((_) {});
  }

  @override
  void dispose() {
    _router.removeListener(_listenRouter);
    unawaited(_currentRouterSubscription.cancel());
    unawaited(_currentRouterSubject.close());
    unawaited(_snackStream.close());
    super.dispose();
  }

  @override
  void addSnack(
    String message, {
    required SnackMessageType messageType,
    EasyDialogDecoration? dialogDecoration,
    EasyDialogAnimationConfiguration? animationConfiguration,
  }) {
    _addToQueue(
      TopSnackBar(
          message: message,
          messageType: messageType,
          dialogDecoration: dialogDecoration,
          animationConfiguration: animationConfiguration),
    );
  }

  /// Clears the snack queue from possible display, which were put in the queue before [closeTime].
  @override
  void clearSnackQueue(DateTime closeTime) {
    _snackQueue.removeWhere(
      /// Subtract a second so that snacks are displayed when the screen is closed.
      (snackData) => snackData.showTime.isBefore(closeTime.add(const Duration(seconds: -1))),
    );
  }

  void _addToQueue(TopSnackBar snack) {
    _snackStream.add(snack);
    _snackQueue.add(snack);
  }

  void _listenRouter() {
    _currentRouterSubject.add(_router.current.name);
  }

  /// When the router changes, we clear the snack queue.
  void _currentRouterListener(List<String> pair) {
    final list = pair.nonNulls;
    if (list.isEmpty) return;

    final areObjectsEqual = list.every((obj) {
      final first = list.firstOrNull;
      if (first == null) return false;

      return obj == first;
    });

    if (areObjectsEqual) return;
    _clearSnackQueue();
  }

  /// Clears the snack queue.
  /// When the screen is closed, all snacks should be closed.
  void _clearSnackQueue() {
    if (_snackQueue.isEmpty) return;
    _snackQueue.clear();
    if (_hasOpenedSnack) {
      unawaited(_snackController.hideSnack());
    }
  }

  Future<void> _showSnackBarDelayed(TopSnackBar snack) async {
    await _completer?.future;

    if (_snackQueue.isEmpty || _snackQueue.firstOrNull != snack) return;

    _completer = Completer()
      ..complete(
        Future.any<void>([
          _showTopSnack(snack),
        ]).whenComplete(() {
          _hasOpenedSnack = false;
          if (_snackQueue.isNotEmpty) {
            final _ = _updateSnackQueue();
          }
        }),
      );
  }

  /// Removes the displayed snack from the snack queue.
  TopSnackBar _updateSnackQueue() {
    return _snackQueue.removeFirst();
  }

  /// Calls the controller to show a snack.
  Future<void> _showTopSnack(TopSnackBar snackBar) async {
    _hasOpenedSnack = true;

    /// If the snack is an error, then we do not hide it automatically.
    final autoHideDuration = snackBar.messageType == SnackMessageType.error ? null : _topSnackDuration;
    await _snackController.showSnack(
      messageType: snackBar.messageType,
      message: snackBar.message,
      dialogDecoration: snackBar.dialogDecoration,
      animationConfiguration: snackBar.animationConfiguration,
      autoHideDuration: autoHideDuration,
      context: context,
    );
  }
}
