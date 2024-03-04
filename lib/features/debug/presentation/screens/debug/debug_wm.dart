import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/mixin/localization_mixin.dart';
import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/debug/di/debug_scope.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_model.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_screen.dart';
import 'package:flutter_template/features/navigation/service/router.dart';
import 'package:flutter_template/features/theme_mode/presentation/theme_mode_provider.dart';
import 'package:flutter_template/l10n/app_localizations_x.dart';
import 'package:provider/provider.dart';

/// Factory for [DebugScreenWM].
DebugScreenWM debugScreenWMFactory(BuildContext context) {
  final appScope = context.read<IAppScope>();
  final debugScope = context.read<IDebugScope>();
  final appRouter = context.read<AppRouter>();
  final appConfig = appScope.appConfig;
  final scaffoldMessenger = ScaffoldMessenger.of(context);

  final model = DebugScreenModel(
    debugRepository: debugScope.debugRepository,
    logWriter: appScope.logger,
  );

  return DebugScreenWM(
    model,
    router: appRouter,
    appConfig: appConfig,
    scaffoldMessenger: scaffoldMessenger,
  );
}

/// Interface for [DebugScreenWM].
abstract interface class IDebugScreenWM with ILocalizationMixin implements IWidgetModel {
  /// Text editing controller for proxy url.
  TextEditingController get proxyEditingController;

  /// Listener current server url state.
  ValueListenable<Url> get serverUrlState;

  /// Callback of clicking on the url radio button.
  void onUrlRadioButtonPressed(Url? url);

  /// Сallback of pressed on the server change button.
  void onChangeServerPressed(Url url);

  /// Сallback of pressed on the connect proxy button.
  void onConnectProxyPressed();

  /// Set theme mode for app.
  void onSetThemeMode(ThemeMode? themeMode);

  /// Navigate to ui kit screen.
  void openUiKit();
}

/// Widget Model for [DebugScreen].
class DebugScreenWM extends WidgetModel<DebugScreen, DebugScreenModel>
    with LocalizationMixin
    implements IDebugScreenWM {
  final AppRouter _router;

  final AppConfig _appConfig;

  final ScaffoldMessengerState _scaffoldMessenger;

  late final TextEditingController _textEditingController;

  late final ValueNotifier<Url> _serverUrlState;

  @override
  ValueListenable<Url> get serverUrlState => _serverUrlState;

  @override
  TextEditingController get proxyEditingController => _textEditingController;

  /// Create an instance [DebugScreenModel].
  DebugScreenWM(
    super._model, {
    required AppRouter router,
    required AppConfig appConfig,
    required ScaffoldMessengerState scaffoldMessenger,
  })  : _router = router,
        _appConfig = appConfig,
        _scaffoldMessenger = scaffoldMessenger;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _textEditingController = TextEditingController(text: _appConfig.proxyUrl);
    _serverUrlState = ValueNotifier(_appConfig.url);
  }

  @override
  void dispose() {
    _serverUrlState.dispose();
    super.dispose();
  }

  @override
  void onUrlRadioButtonPressed(Url? url) {
    if (url == null) return;

    _serverUrlState.value = url;
  }

  @override
  Future<void> onChangeServerPressed(Url url) async {
    await model.saveServerUrl(url);
    _showReloadAppSnackBar();
  }

  @override
  Future<void> onConnectProxyPressed() async {
    await model.saveProxyUrl(_textEditingController.text);
    _showReloadAppSnackBar();
  }

  void _showReloadAppSnackBar() {
    _scaffoldMessenger.showSnackBar(SnackBar(content: Text(context.l10n.debugScreenReloadAppMessage)));
  }

  @override
  void onSetThemeMode(ThemeMode? themeMode) {
    if (themeMode == null) return;
    ThemeModeProvider.of(context).setThemeMode(themeMode);
  }

  @override
  void openUiKit() => _router.push(const UiKitRouter());
}
