import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/common/utils/sizes/app_sizes.dart';
import 'package:flutter_template/features/debug/presentation/screens/log_history/log_history_wm.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_names.dart';

/// Main widget for LogHistory feature.
@RoutePage(
  name: AppRouteNames.logHistoryScreen,
)
class LogHistoryScreen extends ElementaryWidget<ILogHistoryWm> {
  /// Create an instance [LogHistoryScreen].
  const LogHistoryScreen({
    Key? key,
    WidgetModelFactory wmFactory = logHistoryScreenWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ILogHistoryWm wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log History'),
        actions: [
          GestureDetector(
            onTap: wm.clearLogHistory,
            behavior: HitTestBehavior.opaque,
            child: const Padding(
              padding: EdgeInsets.all(AppSizes.double6),
              child: Column(
                children: [
                  Icon(Icons.delete_forever_rounded),
                  Text('Clear'),
                ],
              ),
            ),
          ),
        ],
        centerTitle: false,
      ),
      body: ValueListenableBuilder<String>(
        valueListenable: wm.logHistory,
        builder: (context, logs, _) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppSizes.double8, horizontal: AppSizes.double2),
              child: logs.isEmpty ? const Center(child: Text('History is empty')) : Text(logs),
            ),
          );
        },
      ),
    );
  }
}
