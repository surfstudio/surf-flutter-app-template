import 'package:flutter/material.dart';
import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/features/debug/presentation/debug/debug_screen.dart';
import 'package:flutter_template/features/debug/presentation/debug/debug_wm.dart';
import 'package:flutter_template/l10n/app_localizations_x.dart';
import 'package:mocktail/mocktail.dart';
import 'package:surf_widget_test_composer/surf_widget_test_composer.dart';

class MockDebugWM extends Mock implements IDebugScreenWM {}

void main() {
  final wm = MockDebugWM();

  testWidget<DebugScreen>(
    widgetBuilder: (_, __) => const DebugScreen().build(wm),
    setup: (context, __) {
      when(() => wm.proxyEditingController).thenReturn(TextEditingController());
      when(() => wm.serverUrlState).thenReturn(ValueNotifier<Url>(Url.dev));
      when(() => wm.l10n).thenReturn(context.l10n);
    },
    autoHeight: true,
  );
}
