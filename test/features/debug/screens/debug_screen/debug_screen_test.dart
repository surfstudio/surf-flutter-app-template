import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/debug/screens/debug_screen/debug_screen.dart';
import 'package:flutter_template/features/debug/screens/debug_screen/debug_screen_widget_model.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../core/utils/test_widget.dart';

class MockDebugWM extends Mock implements IDebugScreenWidgetModel {}

void main() {
  final wm = MockDebugWM();
  testWidget<DebugScreen>(
    widgetBuilder: (_) => const DebugScreen().build(wm),
    setup: (theme, mode, l10n) {
      when(() => wm.themeState).thenReturn(StateNotifier(initValue: mode));
      when(() => wm.proxyEditingController).thenReturn(TextEditingController());
      when(() => wm.urlState).thenReturn(
        StateNotifier(initValue: UrlType.test),
      );
    },
  );
}
