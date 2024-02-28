import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/config/urls.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_model.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_screen.dart';
import 'package:flutter_template/features/navigation/service/router.dart';
import 'package:flutter_template/features/theme/presentation/theme_provider.dart';
import 'package:flutter_template/persistence/storage/config_storage/config_storage_impl.dart';
import 'package:provider/provider.dart';

/// Factory for [DebugScreenWidgetModel].
DebugScreenWidgetModel debugScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final configStorage = ConfigSettingsStorageImpl(appDependencies.sharedPreferences);

  final model = DebugScreenModel(
    appDependencies.errorHandler,
    Environment.instance(),
    appDependencies.applicationRebuilder,
    configStorage,
  );

  final router = appDependencies.router;

  return DebugScreenWidgetModel(model, router);
}

/// Widget Model for [DebugScreen].
class DebugScreenWidgetModel extends WidgetModel<DebugScreen, DebugScreenModel> implements IDebugScreenWidgetModel {
  /// Empty string.
  static const String _emptyString = '';

  /// Class that coordinates navigation for the whole app.
  final AppRouter router;

  late final _textEditingController = TextEditingController(
    text: model.proxyUrl,
  );

  @override
  late final ValueNotifier<UrlType> urlState;

  @override
  TextEditingController get proxyEditingController => _textEditingController;

  /// Current value url.
  late String _currentUrl;

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
    urlState = ValueNotifier<UrlType>(
      _resolveUrlType(model.configNotifier.value.url),
    );
    model.configNotifier.addListener(_updateAppConfig);
  }

  @override
  void dispose() {
    model.configNotifier.removeListener(_updateAppConfig);
    super.dispose();
  }

  @override
  void closeScreen() {
    router.pop();
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
    ThemeProvider.read(context)?.setThemeMode(themeMode);
  }

  @override
  void openUiKit() {
    router.push(const UiKitRouter());
  }

  void _updateAppConfig() {
    final config = model.configNotifier.value;

    _currentUrl = config.url;
    urlState.value = _resolveUrlType(_currentUrl);

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

  UrlType _resolveUrlType(String currentUrl) {
    if (currentUrl == Url.testUrl) return UrlType.test;
    if (currentUrl == Url.prodUrl) return UrlType.prod;
    return UrlType.dev;
  }
}

/// Interface for [DebugScreenWidgetModel].
abstract class IDebugScreenWidgetModel implements IWidgetModel {
  /// Text Editing Controller.
  TextEditingController get proxyEditingController;

  /// Listener current state [UrlType].
  ValueListenable<UrlType> get urlState;

  /// Method to close the debug screens.
  void closeScreen() {}

  /// Change url.
  void urlChange(UrlType? urlType) {}

  /// Switch server.
  void switchServer(UrlType urlType) {}

  /// Change proxyUrl value.
  void setProxy() {}

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
