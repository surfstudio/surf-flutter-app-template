import 'package:flutter/material.dart';
import 'package:flutter_template/common/widgets/conditional_wrapper.dart';
import 'package:flutter_template/uikit/colors/app_color_scheme.dart';
import 'package:shimmer/shimmer.dart' as shimmer;

/// {@template shimmer.class}
/// Shimmer for loading content.
/// {@endtemplate}
class Shimmer extends StatelessWidget {
  /// {@macro shimmer.class}
  const Shimmer({required this.child, this.loading = true, super.key});

  /// Content.
  final Widget child;

  /// Is the download in progress at the moment.
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return ConditionalWrapper(
      condition: loading,
      onAddWrapper: (insideChild) => shimmer.Shimmer.fromColors(
        baseColor: colorScheme.shimmer,
        highlightColor: colorScheme.background,
        child: insideChild,
      ),
      child: child,
    );
  }
}
