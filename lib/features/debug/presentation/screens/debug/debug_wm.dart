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

/// Factory for [DebugScreenWidgetModel].
DebugScreenWidgetModel debugScreenWidgetModelFactory(BuildContext context) {
  final appScope = context.read<IAppScope>();
  final debugScope = context.read<IDebugScope>();
  final appRouter = context.read<AppRouter>();

  final model = DebugScreenModel(
    debugRepository: debugScope.debugRepository,
    logWriter: appScope.logger,
    appConfig: appScope.appConfig,
  );

  return DebugScreenWidgetModel(model, appRouter);
}

/// Interface for [DebugScreenWidgetModel].
abstract class IDebugScreenWidgetModel with ILocalizationMixin implements IWidgetModel {
  /// Text Editing Controller.
  TextEditingController get proxyEditingController;

  /// Listener current state [Url].
  ValueListenable<Url> get serverUrlState;

  /// Change url.
  void urlChange(Url? url);

  /// Switch server.
  void switchServer(Url url);

  /// Change proxyUrl value.
  void setProxy();

  /// Set theme mode for app.
  void setThemeMode(ThemeMode? themeMode);

  /// Navigate to ui kit screen.
  void openUiKit();
}

/// Widget Model for [DebugScreen].
class DebugScreenWidgetModel extends WidgetModel<DebugScreen, DebugScreenModel>
    with LocalizationMixin
    implements IDebugScreenWidgetModel {
  /// Class that coordinates navigation for the whole app.
  final AppRouter _router;

  late final TextEditingController _textEditingController;

  late final ScaffoldMessengerState _scaffoldMessenger;

  @override
  ValueListenable<Url> get serverUrlState => model.serverUrlState;

  @override
  TextEditingController get proxyEditingController => _textEditingController;

  /// Create an instance [DebugScreenModel].
  DebugScreenWidgetModel(
    super._model,
    this._router,
  );

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _scaffoldMessenger = ScaffoldMessenger.of(context);
    _textEditingController = TextEditingController(text: model.proxyUrlState.value);
    model.serverUrlState.addListener(_listenServerUrlState);
    model.proxyUrlState.addListener(_listenProxyUrlState);
  }

  @override
  void dispose() {
    model.serverUrlState.removeListener(_listenServerUrlState);
    model.proxyUrlState.removeListener(_listenProxyUrlState);
    super.dispose();
  }

  void _listenServerUrlState() => _showReloadAppSnackBar();

  void _listenProxyUrlState() => _showReloadAppSnackBar();

  void _showReloadAppSnackBar() {
    _scaffoldMessenger.showSnackBar(SnackBar(content: Text(context.l10n.debugScreenReloadAppMessage)));
  }

  @override
  void urlChange(Url? url) {
    if (url == null) return;
    
    // urlState.value = url;
  }

  @override
  Future<void> switchServer(Url url) => model.switchServer(url);

  /// Change proxyUrl value.
  @override
  Future<void> setProxy() => model.setProxy(proxyEditingController.text);

  @override
  void setThemeMode(ThemeMode? themeMode) {
    if (themeMode == null) return;
    // TODO(Evgenia-bit): добавится изменение темы, когда ветка с рефакторингом сервиса темы будет смержена.
  }

  @override
  void openUiKit() => _router.push(const UiKitRouter());
}
