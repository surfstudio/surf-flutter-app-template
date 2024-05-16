import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/down_for_maintenance/domain/entities/server_check_result.dart';
import 'package:flutter_template/features/down_for_maintenance/presentation/down_for_maintenance_wm.dart';

/// Widget that shows child widget if server works normally or shows placeholder if server is down.
class DownForMaintenanceWidget extends ElementaryWidget<IDownForMaintenanceWM> {
  /// Child widget that will be shown if server works normally. Usually it is whole application, but
  /// you also can use it for some part of application (e.g. some feature).
  final Widget child;

  /// @nodoc
  const DownForMaintenanceWidget({
    required this.child,
    super.key,
  }) : super(defaultDownForMaintenanceWMFactory);

  @override
  Widget build(IDownForMaintenanceWM wm) {
    return ValueListenableBuilder(
      valueListenable: wm.currentResult,
      builder: (_, status, __) => switch (status) {
        ServerCheckResult.errorOccurred || ServerCheckResult.notActive => _PlaceholderWidget(
            onRetryPressed: wm.onCheckCurrentStatusPressed,
          ),
        ServerCheckResult.processing => const Center(child: CircularProgressIndicator()),
        ServerCheckResult.worksNormally => child,
      },
    );
  }
}

/// Placeholder widget that shows when server is not available.
/// Replace it with your own widget.
class _PlaceholderWidget extends StatelessWidget {
  final VoidCallback onRetryPressed;
  const _PlaceholderWidget({required this.onRetryPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Server is not available now. Please try again later.'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: onRetryPressed,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
