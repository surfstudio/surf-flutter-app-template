import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/dash/screen/dash_screen_wm.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_names.dart';
import 'package:flutter_template/l10n/app_localizations_x.dart';

/// Main widget for DashScreen feature.
@RoutePage(
  name: AppRouteNames.dashScreen,
)
class DashScreen extends ElementaryWidget<IDashScreenWidgetModel> {
  /// Create an instance [DashScreen].
  const DashScreen({
    Key? key,
    WidgetModelFactory wmFactory = dashScreenWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IDashScreenWidgetModel wm) {
    return ColoredBox(
      color: wm.colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            wm.l10n.examplesTitle,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const _LocalizationExamples(),
          const SizedBox(height: 46),
          _AnalyticsExample(trackAnalyticsExample: wm.trackAnalyticsExample),
        ],
      ),
    );
  }
}

class _LocalizationExamples extends StatelessWidget {
  const _LocalizationExamples();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.l10n.examplesLocalizationTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(context.l10n.string('Username')),
        Text(context.l10n.thingsWithCount(1)),
        Text(context.l10n.date(DateTime.now())),
      ],
    );
  }
}

class _AnalyticsExample extends StatelessWidget {
  final VoidCallback trackAnalyticsExample;

  const _AnalyticsExample({
    required this.trackAnalyticsExample,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: trackAnalyticsExample,
      child: const Text('Track analytics example'),
    );
  }
}
