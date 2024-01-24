import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/{{name.snakeCase()}}/screen/{{name.snakeCase()}}_wm.dart';

/// {{name.pascalCase()}}Screen
class {{name.pascalCase()}}Screen extends ElementaryWidget<I{{name.pascalCase()}}WM> {
  /// Create an instance [{{name.pascalCase()}}Screen]
  const {{name.pascalCase()}}Screen ({
    super.key,
    WidgetModelFactory wmFactory = default{{name.pascalCase()}}WMFactory,
  }) : super(wmFactory);

  @override
  Widget build(I{{name.pascalCase()}}WM wm) {
    return const Placeholder();
  }
}
