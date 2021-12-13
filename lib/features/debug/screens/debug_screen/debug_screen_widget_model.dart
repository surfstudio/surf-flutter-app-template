import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_template/config/config.dart';
import 'package:flutter_template/config/debug_options.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/config/urls.dart';
import 'package:flutter_template/features/app/di/i_app_scope.dart';
import 'package:flutter_template/features/debug/screens/debug_screen/debug_screen.dart';
import 'package:flutter_template/features/debug/screens/debug_screen/debug_screen_model.dart';
import 'package:provider/provider.dart';

// ignore_for_file: avoid_positional_boolean_parameters

/// Ury type.
enum UrlType {
  /// Test.
  test,

  /// Prod.
  prod,

  /// Dev.
  dev,
}

/// Empty string.
const String emptyString = '';

/// Factory for [DebugScreenWidgetModel].
DebugScreenWidgetModel debugScreenWidgetModelFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final model = DebugScreenModel(
    appDependencies.errorHandler,
    Environment<Config>.instance(),
    appDependencies.applicationRebuilder,
    appDependencies.coordinator,
  );
  return DebugScreenWidgetModel(model);
}

/// Widget Model for [DebugScreen].
class DebugScreenWidgetModel extends WidgetModel<DebugScreen, DebugScreenModel>
    implements IDebugWidgetModel {

  /// Controller for TextField.
  final textEditingController = TextEditingController();
  final _debugOptionsState = StateNotifier<DebugOptions>();
  final _urlState = StateNotifier<UrlType>();

  /// Current value url.
  late String currentUrl;

  /// Proxy url.
  late String? proxyUrl;

  @override
  StateNotifier<DebugOptions> get debugOptionsState => _debugOptionsState;

  @override
  StateNotifier<UrlType> get urlState => _urlState;

  /// Proxy state.
  StateNotifier<String> get proxyValueState => model.proxyValueState;

  /// Create an instance [DebugScreenModel].
  DebugScreenWidgetModel(DebugScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    model.configNotifier.addListener(_acceptNewValueDebugOptions);
    textEditingController.addListener(_updateProxyValueState);

    currentUrl = model.configNotifier.value.url;
    proxyUrl = model.configNotifier.value.proxyUrl;

    if (currentUrl == Url.testUrl) {
      urlState.accept(UrlType.test);
    } else if (currentUrl == Url.prodUrl) {
      urlState.accept(UrlType.prod);
    } else {
      urlState.accept(UrlType.dev);
    }

    if (proxyUrl != null && proxyUrl!.isNotEmpty) {
      model.proxyValueState.accept(proxyUrl);
      textEditingController.text = proxyUrl!;
    } else {
      model.proxyValueState.accept(emptyString);
      textEditingController.text = emptyString;
    }
    debugOptionsState.accept(model.configNotifier.value.debugOptions);
  }

  @override
  void dispose() {
    model.configNotifier.removeListener(_acceptNewValueDebugOptions);
    textEditingController.removeListener(_updateProxyValueState);
    super.dispose();
  }

  /// Method to close the debug screens.
  void closeScreen() {
    model.coordinator.pop();
  }

  /// Change url.
  void urlChange(UrlType? urlType) => _urlState.accept(urlType);

  /// Switch server.
  void switchServer(UrlType urlType) {
    model.switchServer(urlType);
  }

  /// Change showPerformanceOverlay value in debugOptions.
  void showPerformanceOverlayChange(bool? value) {
    model.showPerformanceOverlayChange(value);
  }

  /// Change debugShowMaterialGrid value in debugOptions.
  void debugShowMaterialGridChange(bool? value) {
    model.debugShowMaterialGridChange(value);
  }

  /// Change debugShowCheckedModeBanner value in debugOptions.
  void debugShowCheckedModeBannerChange(bool? value) {
    model.debugShowCheckedModeBannerChange(value);
  }

  /// Change checkerboardRasterCacheImages value in debugOptions.
  void checkerboardRasterCacheImagesChange(bool? value) {
    model.checkerboardRasterCacheImagesChange(value);
  }

  /// Change checkerboardRasterCacheImages value in debugOptions.
  void checkerboardOffscreenLayersChange(bool? value) {
    model.checkerboardOffscreenLayersChange(value);
  }

  /// Change showSemanticsDebugger value in debugOptions.
  void showSemanticsDebuggerChange(bool? value) {
    model.showSemanticsDebuggerChange(value);
  }

  /// Change proxyUrl value.
  void setProxy() {
    model.setProxy();
  }

  void _updateProxyValueState() =>
      model.proxyValueState.accept(textEditingController.text);

  void _acceptNewValueDebugOptions() {
    debugOptionsState.accept(model.configNotifier.value.debugOptions);
  }
}

/// Interface of [DebugScreenWidgetModel].
abstract class IDebugWidgetModel extends IWidgetModel {
  /// Listener current state [DebugOptions].
  ListenableState<DebugOptions> get debugOptionsState;

  /// Listener current state [UrlType].
  ListenableState<UrlType> get urlState;
}
