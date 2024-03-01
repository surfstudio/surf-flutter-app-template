import 'package:flutter/material.dart';
import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_screen.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_wm.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../core/utils/test_widget.dart';

class MockDebugWM extends Mock implements IDebugScreenWM {}

void main() {
  final wm = MockDebugWM();
  testWidget<DebugScreen>(
    widgetBuilder: (_) => const DebugScreen().build(wm),
    setup: (theme, mode, l10n) {
      when(() => wm.proxyEditingController).thenReturn(TextEditingController());
      when(() => wm.serverUrlState).thenReturn(ValueNotifier<Url>(Url.dev));
      when(() => wm.l10n).thenReturn(l10n);
    },
  );
}
