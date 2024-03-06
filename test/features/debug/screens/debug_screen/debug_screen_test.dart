import 'package:flutter/material.dart';
import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_screen.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_wm.dart';
import 'package:mocktail/mocktail.dart';
import 'package:surf_widget_test_composer/surf_widget_test_composer.dart';

class MockDebugWM extends Mock implements IDebugScreenWidgetModel {}

void main() {
  final wm = MockDebugWM();

  testWidget<DebugScreen>(
    widgetBuilder: (_, __) => const DebugScreen().build(wm),
    setup: (_, __) {
      when(() => wm.proxyEditingController).thenReturn(TextEditingController());
      when(() => wm.urlState).thenReturn(ValueNotifier<Url>(Url.qa));
    },
    autoHeight: true,
  );
}
