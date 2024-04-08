import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/feature_example/presentation/feature_example_wm.dart';
import 'package:union_state/union_state.dart';

/// {@template feature_example_screen.class}
/// FeatureExampleScreen.
/// {@endtemplate}
class FeatureExampleScreen extends ElementaryWidget<IFeatureExampleWM> {
  /// {@macro feature_example_screen.class}
  const FeatureExampleScreen({
    super.key,
    WidgetModelFactory wmFactory = defaultFeatureExampleWMFactory,
  }) : super(wmFactory);

  @override
  Widget build(IFeatureExampleWM wm) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: UnionStateListenableBuilder(
          unionStateListenable: wm.state,
          builder: (_, data) => Text(data.ip),
          loadingBuilder: (_, __) => const CircularProgressIndicator(),
          failureBuilder: (_, __, ___) => Text(wm.l10n.featureExampleFailedLoadIpMessage),
        ),
      ),
    );
  }
}
