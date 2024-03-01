import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/mixin/localization_mixin.dart';
import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/debug/di/debug_scope.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_model.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_screen.dart';
import 'package:flutter_template/features/navigation/service/router.dart';
import 'package:flutter_template/l10n/app_localizations_x.dart';
import 'package:provider/provider.dart';

/// Factory for [DebugScreenWM].
DebugScreenWM debugScreenWMFactory(BuildContext context) {
  final appScope = context.read<IAppScope>();
  final debugScope = context.read<IDebugScope>();
  final appRouter = context.read<AppRouter>();
  final appConfig = appScope.appConfig;

  final model = DebugScreenModel(
    debugRepository: debugScope.debugRepository,
    logWriter: appScope.logger,
    serverUrl: appConfig.url,
  );

  return DebugScreenWM(model, router: appRouter, proxyUrl: appConfig.proxyUrl);
}

/// Interface for [DebugScreenWM].
abstract class IDebugScreenWM with ILocalizationMixin implements IWidgetModel {
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

  final String? _initialProxyUrl;

  late final TextEditingController _textEditingController;

  late final ScaffoldMessengerState _scaffoldMessenger;

  @override
  ValueListenable<Url> get serverUrlState => model.serverUrlState;

  @override
  TextEditingController get proxyEditingController => _textEditingController;

  /// Create an instance [DebugScreenModel].
  DebugScreenWM(
    super._model, {
    required AppRouter router,
    required String? proxyUrl,
  })  : _router = router,
        _initialProxyUrl = proxyUrl;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _scaffoldMessenger = ScaffoldMessenger.of(context);
    _textEditingController = TextEditingController(text: _initialProxyUrl);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onUrlRadioButtonPressed(Url? url) {
    if (url == null) return;

    model.emitServerUrlState(url);
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
    // TODO(Evgenia-bit): добавится изменение темы, когда ветка с рефакторингом сервиса темы будет смержена.
  }

  @override
  void openUiKit() => _router.push(UiKitRouter());
}
