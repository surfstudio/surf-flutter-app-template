import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/{{name.snakeCase()}}/screen/{{name.snakeCase()}}_wm.dart';

/// {@template {{name.snakeCase()}}_screen.class}
/// {{name.pascalCase()}}Screen
/// {@endtemplate}
class {{name.pascalCase()}}Screen extends ElementaryWidget<I{{name.pascalCase()}}WM> {
  /// {@macro {{name.snakeCase()}}_screen.class}
  const {{name.pascalCase()}}Screen ({
    super.key,
    WidgetModelFactory wmFactory = default{{name.pascalCase()}}WMFactory,
  }) : super(wmFactory);

  @override
  Widget build(I{{name.pascalCase()}}WM wm) {
    return const Placeholder();
  }
}
