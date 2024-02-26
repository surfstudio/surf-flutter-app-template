import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/feature_example/presentation/screens/api_interact_example/api_interact_example_state.dart';
import 'package:flutter_template/features/feature_example/presentation/screens/api_interact_example/api_interact_example_wm.dart';

/// {@template feature_example_screen.class}
/// ApiInteractExampleScreen
/// {@endtemplate}
class ApiInteractExampleScreen extends ElementaryWidget<IApiInteractExampleWM> {
  /// {@macro feature_example_screen.class}
  const ApiInteractExampleScreen({
    super.key,
    WidgetModelFactory wmFactory = defaultApiInteractExampleWMFactory,
  }) : super(wmFactory);

  @override
  Widget build(IApiInteractExampleWM wm) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ValueListenableBuilder<ApiInteractExampleState>(
          valueListenable: wm.screenState,
          builder: (_, state, __) => switch (state) {
            ApiInteractExampleStateInitial _ => const SizedBox.shrink(),
            ApiInteractExampleStateLoading _ => const CircularProgressIndicator(),
            ApiInteractExampleStateLoaded(:final ip) => Text(ip),
            ApiInteractExampleStateError _ => Text(wm.l10n.failedLoadIpMessage),
          },
        ),
      ),
    );
  }
}
