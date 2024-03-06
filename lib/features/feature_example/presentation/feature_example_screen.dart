import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/feature_example/presentation/feature_example_state.dart';
import 'package:flutter_template/features/feature_example/presentation/feature_example_wm.dart';

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
    const FeatureExampleStateInitial();
    
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ValueListenableBuilder<FeatureExampleState>(
          valueListenable: wm.state,
          builder: (_, state, __) => switch (state) {
            FeatureExampleStateInitial _ => const SizedBox.shrink(),
            FeatureExampleStateLoading _ => const CircularProgressIndicator(),
            FeatureExampleStateLoaded(:final ip) => Text(ip),
            FeatureExampleStateError _ => Text(wm.l10n.featureExampleFailedLoadIpMessage),
          },
        ),
      ),
    );
  }
}
