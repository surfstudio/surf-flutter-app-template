import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/debug/di/debug_scope.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_model.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_screen.dart';
import 'package:flutter_template/features/navigation/service/router.dart';
import 'package:flutter_template/features/theme/presentation/theme_wm.dart';
import 'package:provider/provider.dart';

/// Factory for [DebugScreenWidgetModel].
DebugScreenWidgetModel debugScreenWidgetModelFactory(BuildContext context) {
  final appScope = context.read<IAppScope>();
  final debugScope = context.read<IDebugScope>();
  final appRouter = context.read<AppRouter>();

  final model = DebugScreenModel(
    debugScope.debugRepository,
    appScope.appConfig,
    logWriter: appScope.logger,
  );

  return DebugScreenWidgetModel(model, appRouter);
}

/// Widget Model for [DebugScreen].
class DebugScreenWidgetModel extends WidgetModel<DebugScreen, DebugScreenModel> implements IDebugScreenWidgetModel {
  /// Empty string.
  static const String _emptyString = '';

  /// Class that coordinates navigation for the whole app.
  final AppRouter router;

  late final _textEditingController = TextEditingController(text: model.proxyUrl);

  @override
  late final ValueNotifier<Url> urlState;


  @override
  TextEditingController get proxyEditingController => _textEditingController;

  /// Current value url.
  late Url _currentUrl;

  /// Proxy url.
  late String? _proxyUrl;

  /// Create an instance [DebugScreenModel].
  DebugScreenWidgetModel(
    super._model,
    this.router,
  );

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    urlState = ValueNotifier<Url>(model.configNotifier.value.url);
    model.configNotifier.addListener(_updateAppConfig);
  }

  @override
  void dispose() {
    model.configNotifier.removeListener(_updateAppConfig);
    super.dispose();
  }

  @override
  void urlChange(Url? url) {
    if (url == null) return;
    urlState.value = url;
  }

  @override
  Future<void> switchServer(Url url) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    await model.switchServer(url);

    scaffoldMessenger.showSnackBar(
      const SnackBar(content: Text('Reload the app to see applied changes')),
    );
  }

  /// Change proxyUrl value.
  @override
  Future<void> setProxy() async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    await model.setProxy(proxyEditingController.text);

    scaffoldMessenger.showSnackBar(
      const SnackBar(content: Text('Reload the app to see applied changes')),
    );
  }

  @override
  void setThemeMode(ThemeMode? themeMode) {
    if (themeMode == null) return;
    context.read<IThemeWM>().setThemeMode(themeMode);
  }

  @override
  void openUiKit() {
    router.push(const UiKitRouter());
  }

  void _updateAppConfig() {
    final config = model.configNotifier.value;

    _currentUrl = config.url;
    urlState.value = _currentUrl;

    _proxyUrl = config.proxyUrl;
    if (_proxyUrl != null && _proxyUrl!.isNotEmpty) {
      proxyEditingController
        ..text = _proxyUrl!
        ..selection = TextSelection.collapsed(
          offset: _proxyUrl!.length,
        );
    } else {
      proxyEditingController.text = _emptyString;
    }
  }
}

/// Interface for [DebugScreenWidgetModel].
abstract class IDebugScreenWidgetModel implements IWidgetModel {
  /// Text Editing Controller.
  TextEditingController get proxyEditingController;

  /// Listener current state [Url].
  ValueListenable<Url> get urlState;


  /// Change url.
  void urlChange(Url? url) {}

  /// Switch server.
  void switchServer(Url url) {}

  /// Change proxyUrl value.
  void setProxy() {}

  /// Set theme mode for app.
  void setThemeMode(ThemeMode? themeMode) {}

  /// Navigate to ui kit screen.
  void openUiKit();
}
