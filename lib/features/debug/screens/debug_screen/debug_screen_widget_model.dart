import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/debug_options.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/config/urls.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/debug/screens/debug_screen/debug_screen.dart';
import 'package:flutter_template/features/debug/screens/debug_screen/debug_screen_model.dart';
import 'package:flutter_template/features/navigation/service/coordinator.dart';
import 'package:provider/provider.dart';

// ignore_for_file: avoid_positional_boolean_parameters

/// Factory for [DebugScreenWidgetModel].
DebugScreenWidgetModel debugScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final model = DebugScreenModel(
    appDependencies.errorHandler,
    Environment<AppConfig>.instance(),
    appDependencies.applicationRebuilder,
  );
  final coordinator = appDependencies.coordinator;
  return DebugScreenWidgetModel(model, coordinator);
}

/// Widget Model for [DebugScreen].
class DebugScreenWidgetModel extends WidgetModel<DebugScreen, DebugScreenModel>
    implements IDebugScreenWidgetModel {
  /// Empty string.
  static const String _emptyString = '';

  /// Class that coordinates navigation for the whole app.
  final Coordinator coordinator;

  final _textEditingController = TextEditingController();
  final _debugOptionsState = StateNotifier<DebugOptions>();
  final _urlState = StateNotifier<UrlType>();

  @override
  TextEditingController get proxyEditingController => _textEditingController;

  @override
  ListenableState<DebugOptions> get debugOptionsState => _debugOptionsState;

  @override
  ListenableState<UrlType> get urlState => _urlState;

  /// Current value url.
  late String _currentUrl;

  /// Proxy url.
  late String? _proxyUrl;

  /// Create an instance [DebugScreenModel].
  DebugScreenWidgetModel(
    DebugScreenModel model,
    this.coordinator,
  ) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    model.configNotifier.addListener(_updateAppConfig);
  }

  @override
  void dispose() {
    model.configNotifier.removeListener(_updateAppConfig);
    super.dispose();
  }

  @override
  void closeScreen() {
    coordinator.pop();
  }

  @override
  void urlChange(UrlType? urlType) => _urlState.accept(urlType);

  @override
  void switchServer(UrlType urlType) {
    model.switchServer(urlType);
  }

  @override
  void showPerformanceOverlayChange(bool? value) {
    model.showPerformanceOverlayChange(value);
  }

  @override
  void debugShowMaterialGridChange(bool? value) {
    model.debugShowMaterialGridChange(value);
  }

  @override
  void debugShowCheckedModeBannerChange(bool? value) {
    model.debugShowCheckedModeBannerChange(value);
  }

  @override
  void checkerboardRasterCacheImagesChange(bool? value) {
    model.checkerboardRasterCacheImagesChange(value);
  }

  @override
  void checkerboardOffscreenLayersChange(bool? value) {
    model.checkerboardOffscreenLayersChange(value);
  }

  @override
  void showSemanticsDebuggerChange(bool? value) {
    model.showSemanticsDebuggerChange(value);
  }

  /// Change proxyUrl value.
  @override
  void setProxy() {
    model.setProxy(proxyEditingController.text);
  }

  void _updateAppConfig() {
    final config = model.configNotifier.value;

    _currentUrl = config.url;
    _proxyUrl = config.proxyUrl;

    if (_currentUrl == Url.testUrl) {
      _urlState.accept(UrlType.test);
    } else if (_currentUrl == Url.prodUrl) {
      _urlState.accept(UrlType.prod);
    } else {
      _urlState.accept(UrlType.dev);
    }

    if (_proxyUrl != null && _proxyUrl!.isNotEmpty) {
      proxyEditingController.text = _proxyUrl!;
    } else {
      proxyEditingController.text = _emptyString;
    }
    _debugOptionsState.accept(config.debugOptions);
  }
}

/// Interface of [DebugScreenWidgetModel].
abstract class IDebugScreenWidgetModel extends IWidgetModel {
  /// Text Editing Controller.
  TextEditingController get proxyEditingController;

  /// Listener current state [DebugOptions].
  ListenableState<DebugOptions> get debugOptionsState;

  /// Listener current state [UrlType].
  ListenableState<UrlType> get urlState;

  /// Method to close the debug screens.
  void closeScreen() {}

  /// Change url.
  void urlChange(UrlType? urlType) {}

  /// Change showPerformanceOverlay value in debugOptions.
  void showPerformanceOverlayChange(bool? value) {}

  /// Change debugShowMaterialGrid value in debugOptions.
  void debugShowMaterialGridChange(bool? value) {}

  /// Change debugShowCheckedModeBanner value in debugOptions.
  void debugShowCheckedModeBannerChange(bool? value) {}

  /// Change checkerboardRasterCacheImages value in debugOptions.
  void checkerboardRasterCacheImagesChange(bool? value) {}

  /// Change checkerboardRasterCacheImages value in debugOptions.
  void checkerboardOffscreenLayersChange(bool? value) {}

  /// Change showSemanticsDebugger value in debugOptions.
  void showSemanticsDebuggerChange(bool? value) {}

  /// Switch server.
  void switchServer(UrlType urlType) {}

  /// Change proxyUrl value.
  void setProxy() {}
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