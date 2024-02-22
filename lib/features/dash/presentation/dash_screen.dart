import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/common/utils/sizes/app_sizes.dart';
import 'package:flutter_template/features/dash/presentation/dash_wm.dart';
import 'package:flutter_template/l10n/app_localizations_x.dart';

/// Main widget for DashScreen feature.
class DashScreen extends ElementaryWidget<IDashWidgetModel> {
  /// Create an instance [DashScreen].
  const DashScreen({
    Key? key,
    WidgetModelFactory wmFactory = dashScreenWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IDashWidgetModel wm) {
    return ColoredBox(
      color: wm.colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            wm.l10n.examplesTitle,
            style: const TextStyle(fontSize: AppSizes.double20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppSizes.double16),
          const _LocalizationExamples(),
          const SizedBox(height: AppSizes.double32),
          _AnalyticsExample(onTrackAnalyticsExample: wm.trackAnalyticsExample),
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
        const SizedBox(height: AppSizes.double8),
        Text(context.l10n.string('Username')),
        Text(context.l10n.thingsWithCount(1)),
        Text(context.l10n.date(DateTime.now())),
      ],
    );
  }
}

class _AnalyticsExample extends StatelessWidget {
  const _AnalyticsExample({
    required this.onTrackAnalyticsExample,
  });

  final VoidCallback onTrackAnalyticsExample;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onTrackAnalyticsExample,
      child: const Text('Track analytics example'),
    );
  }
}
