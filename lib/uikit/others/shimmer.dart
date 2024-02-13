import 'package:flutter/material.dart';
import 'package:flutter_template/assets/colors/color_scheme.dart';
import 'package:flutter_template/uikit/others/conditional_wrapper.dart';
import 'package:shimmer/shimmer.dart' as shimmer;

/// {@template shimmer.class}
/// Shimmer for loading content.
/// {@endtemplate}
class Shimmer extends StatelessWidget {
  /// content.
  final Widget child;

  /// Is the download in progress at the moment.
  final bool loading;

  /// {@macro shimmer.class}
  const Shimmer({required this.child, this.loading = true, super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return ConditionalWrapper(
      condition: loading,
      wrapper: (child) => shimmer.Shimmer.fromColors(
        baseColor: colorScheme.shimmer,
        highlightColor: colorScheme.background,
        child: child,
      ),
      child: child,
    );
  }
}
