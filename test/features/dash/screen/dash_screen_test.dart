import 'package:flutter_template/features/dash/screen/dash_screen.dart';
import 'package:flutter_template/features/dash/screen/dash_screen_wm.dart';
import 'package:mocktail/mocktail.dart';

import '../../../core/utils/test_widget.dart';

class MockDashWM extends Mock implements IDashScreenWidgetModel {}

void main() {
  final wm = MockDashWM();

  testWidget<DashScreen>(
    widgetBuilder: (_) => const DashScreen().build(wm),
    setup: (theme, _, l10n) {
      when(() => wm.colorScheme).thenReturn(theme.customColorScheme);
      when(() => wm.textScheme).thenReturn(theme.customTextTheme);
      when(() => wm.l10n).thenReturn(l10n);
    },
  );
}
