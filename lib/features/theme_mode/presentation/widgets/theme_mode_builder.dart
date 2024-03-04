import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/theme_mode/presentation/theme_mode_provider.dart';

/// Signature for widget builder with ThemeMode.
typedef ThemeModeWidgetBuilder = Widget Function(BuildContext context, ThemeMode themeMode);

/// {@template theme_mode_builder.class}
/// A widget that calls [builder] when the theme mode changes.
/// {@endtemplate}
class ThemeModeBuilder extends StatefulWidget {
  /// ThemeModeWidgetBuilder.
  final ThemeModeWidgetBuilder builder;

  /// {@macro theme_mode_builder.class}
  const ThemeModeBuilder({
    required this.builder,
    super.key,
  });

  @override
  State<ThemeModeBuilder> createState() => _ThemeModeBuilderState();
}

class _ThemeModeBuilderState extends State<ThemeModeBuilder> {
  late final ValueListenable<ThemeMode> _themeModeListenable;

  @override
  void initState() {
    super.initState();
    _themeModeListenable = ThemeModeProvider.of(context).themeMode;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeModeListenable,
      builder: (context, themeMode, _) => widget.builder(context, themeMode),
    );
  }
}
