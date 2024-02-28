import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/debug/di/debug_scope.dart';
import 'package:flutter_template/features/debug/domain/entities/url_type_entity.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_model.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_screen.dart';
import 'package:flutter_template/features/navigation/service/router.dart';
import 'package:provider/provider.dart';

/// Factory for [DebugScreenWidgetModel].
DebugScreenWidgetModel debugScreenWidgetModelFactory(BuildContext context) {
  final appScope = context.read<IAppScope>();
  final debugScope = context.read<IDebugScope>();
  final appRouter = context.read<AppRouter>();

  final model = DebugScreenModel(
    debugScope.debugRepository,
    appScope.appConfig,
    appScope.themeService,
    logWriter: appScope.logger,
  );

  return DebugScreenWidgetModel(model, appRouter);
}

/// Widget Model for [DebugScreen].
class DebugScreenWidgetModel extends WidgetModel<DebugScreen, DebugScreenModel>
    implements IDebugScreenWidgetModel {
  /// Empty string.
  static const String _emptyString = '';

  /// Class that coordinates navigation for the whole app.
  final AppRouter router;

  late final _textEditingController = TextEditingController(text: model.proxyUrl);

  @override
  late final ValueNotifier<UrlTypeEntity> urlState;

  @override
  late final ValueNotifier<ThemeMode> themeState;

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
    urlState = ValueNotifier<UrlTypeEntity>(
      _resolveUrlType(model.configNotifier.value.url),
    );
    themeState = ValueNotifier<ThemeMode>(model.currentThemeMode.value);
    model.configNotifier.addListener(_updateAppConfig);
    model.currentThemeMode.addListener(_updateThemeMode);
  }

  @override
  void dispose() {
    model.configNotifier.removeListener(_updateAppConfig);
    super.dispose();
  }

  @override
  void urlChange(UrlTypeEntity? urlType) {
    if (urlType == null) return;
    urlState.value = urlType;
  }

  @override
  Future<void> switchServer(UrlTypeEntity urlType) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    await model.switchServer(urlType);

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
    model.setThemeMode(themeMode);
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

  void _updateThemeMode() {
    themeState.value = model.currentThemeMode.value;
  }

  UrlTypeEntity _resolveUrlType(String currentUrl) {
    if (currentUrl == Url.qaUrl) return UrlTypeEntity.qa;
    if (currentUrl == Url.prodUrl) return UrlTypeEntity.prod;
    return UrlTypeEntity.dev;
  }
}

/// Interface for [DebugScreenWidgetModel].
abstract class IDebugScreenWidgetModel implements IWidgetModel {
  /// Text Editing Controller.
  TextEditingController get proxyEditingController;

  /// Listener current state [UrlTypeEntity].
  ValueListenable<UrlTypeEntity> get urlState;

  /// Listener current state [ThemeMode].
  ValueListenable<ThemeMode> get themeState;

  /// Change url.
  void urlChange(UrlTypeEntity? urlType) {}

  /// Switch server.
  void switchServer(UrlTypeEntity urlType) {}

  /// Change proxyUrl value.
  void setProxy() {}

  /// Set theme mode for app.
  void setThemeMode(ThemeMode? themeMode) {}

  /// Navigate to ui kit screen.
  void openUiKit();
}
