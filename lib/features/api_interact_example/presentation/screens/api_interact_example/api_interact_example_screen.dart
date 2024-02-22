import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/api_interact_example/presentation/screens/api_interact_example/api_interact_example_wm.dart';
import 'package:union_state/union_state.dart';

/// {@template api_interact_example_screen.class}
/// ApiInteractExampleScreen
/// {@endtemplate}
class ApiInteractExampleScreen extends ElementaryWidget<IApiInteractExampleWM> {
  /// {@macro api_interact_example_screen.class}
  const ApiInteractExampleScreen({
    super.key,
    WidgetModelFactory wmFactory = defaultApiInteractExampleWMFactory,
  }) : super(wmFactory);

  @override
  Widget build(IApiInteractExampleWM wm) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: UnionStateListenableBuilder(
          unionStateListenable: wm.ipState,
          builder: (_, ip) => Text(ip ?? ''),
          loadingBuilder: (_, __) => const CircularProgressIndicator(),
          failureBuilder: (_, __, ___) => Text(wm.l10n.failedLoadIpMessage),
        ),
      ),
    );
  }
}
