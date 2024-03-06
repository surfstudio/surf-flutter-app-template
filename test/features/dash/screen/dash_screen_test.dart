import 'package:flutter_template/features/dash/presentation/dash_screen.dart';
import 'package:flutter_template/features/dash/presentation/dash_wm.dart';
import 'package:flutter_template/l10n/app_localizations_x.dart';
import 'package:flutter_template/uikit/colors/color_scheme.dart';
import 'package:flutter_template/uikit/text/text_extention.dart';
import 'package:mocktail/mocktail.dart';
import 'package:surf_widget_test_composer/utils/test_widget.dart';

class MockDashWM extends Mock implements IDashWidgetModel {}

void main() {
  final wm = MockDashWM();

  testWidget<DashScreen>(
    widgetBuilder: (_, __) => const DashScreen().build(wm),
    setup: (context, _) {
      when(() => wm.colorScheme).thenReturn(AppColorScheme.of(context));
      when(() => wm.textScheme).thenReturn(AppTextTheme.of(context));
      when(() => wm.l10n).thenReturn(context.l10n);
    },
    autoHeight: true,
  );
}
