import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/config/urls.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_model.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_screen.dart';
import 'package:flutter_template/features/navigation/service/app_router.dart';
import 'package:flutter_template/persistence/storage/config_storage/i_config_settings_storage.dart';
import 'package:provider/provider.dart';

/// Factory for [DebugScreenWidgetModel].
DebugScreenWidgetModel debugScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final configStorage = ConfigSettingsStorage(appDependencies.sharedPreferences);

  final model = DebugModel(
    appDependencies.errorHandler,
    Environment.instance(),
    appDependencies.applicationRebuilder,
    configStorage,
    appDependencies.themeService,
  );

  final router = appDependencies.router;


  return DebugScreenWidgetModel(model, router);
}

/// Widget Model for [DebugScreen].
class DebugScreenWidgetModel extends WidgetModel<DebugScreen, DebugModel>
    implements IDebugScreenWidgetModel {
  /// Class that coordinates navigation for the whole app.
  final AppRouter router;

  @override
  late final ValueNotifier<UrlType> urlState;

  @override
  late final ValueNotifier<ThemeMode> themeState;

  /// Empty string.
  static const _emptyString = '';

  late final _textEditingController = TextEditingController(
    text: model.proxyUrl,
  );

  /// Current value url.
  late String _currentUrl;

  /// Proxy url.
  late String? _proxyUrl;

  @override
  TextEditingController get proxyEditingController => _textEditingController;

  /// Create an instance [DebugModel].
  DebugScreenWidgetModel(
    super._model,
    this.router,
  );

  @override
  void dispose() {
    model.configNotifier.removeListener(_updateAppConfig);
    super.dispose();
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    urlState = ValueNotifier<UrlType>(
      _resolveUrlType(model.configNotifier.value.url),
    );
    themeState = ValueNotifier<ThemeMode>(model.currentThemeMode.value);
    model.configNotifier.addListener(_updateAppConfig);
    model.currentThemeMode.addListener(_updateThemeMode);
  }

  @override
  void closeScreen() {
    unawaited(router.pop());
  }

  @override
  void urlChange(UrlType? urlType) {
    if (urlType == null) return;
    urlState.value = urlType;
  }

  @override
  void switchServer(UrlType urlType) {
    model.switchServer(urlType);
  }

  /// Change proxyUrl value.
  @override
  void setProxy() {
    model.setProxy(proxyEditingController.text);
  }

  @override
  void setThemeMode(ThemeMode? themeMode) {
    if (themeMode == null) return;
    model.setThemeMode(themeMode);
  }

  @override
  void openUiKit() {
    unawaited(router.push(const UiKitRouter()));
  }

  void _updateAppConfig() {
    final config = model.configNotifier.value;

    _currentUrl = config.url;
    urlState.value = _resolveUrlType(_currentUrl);

    _proxyUrl = config.proxyUrl;
    final proxyUrl = _proxyUrl;

    if (proxyUrl != null && proxyUrl.isNotEmpty) {
      proxyEditingController
        ..text = proxyUrl
        ..selection = TextSelection.collapsed(
          offset: proxyUrl.length,
        );
    } else {
      proxyEditingController.text = _emptyString;
    }
  }

  void _updateThemeMode() {
    themeState.value = model.currentThemeMode.value;
  }

  UrlType _resolveUrlType(String currentUrl) {
    if (currentUrl == Urls.testUrl) return UrlType.test;
    if (currentUrl == Urls.prodUrl) return UrlType.prod;

    return UrlType.dev;
  }
}

/// Interface for [DebugScreenWidgetModel].
abstract class IDebugScreenWidgetModel implements IWidgetModel {
  /// Text Editing Controller.
  TextEditingController get proxyEditingController;

  /// Listener current state [UrlType].
  ValueListenable<UrlType> get urlState;

  /// Listener current state [ThemeMode].
  ValueListenable<ThemeMode> get themeState;

  /// Method to close the debug screens.
  void closeScreen();

  /// Change url.
  void urlChange(UrlType? urlType);

  /// Switch server.
  void switchServer(UrlType urlType);

  /// Change proxyUrl value.
  void setProxy();

  /// Set theme mode for app.
  void setThemeMode(ThemeMode? themeMode) {}

  /// Navigate to ui kit screen.
  void openUiKit();
}

/// Ury type.
enum UrlType {
  /// Test.
  test,

  /// Prod.
  prod,

  /// Dev.
  dev,
}
