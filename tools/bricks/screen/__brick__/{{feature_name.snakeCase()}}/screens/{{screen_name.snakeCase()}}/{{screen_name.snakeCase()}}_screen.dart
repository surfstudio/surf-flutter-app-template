import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/{{feature_name.snakeCase()}}/screens/{{screen_name.snakeCase()}}/{{screen_name.snakeCase()}}_wm.dart';

/// {{screen_name.pascalCase()}}Screen
@RoutePage()
class {{screen_name.pascalCase()}}Screen extends ElementaryWidget<I{{screen_name.pascalCase()}}WM> {
  /// Create an instance [{{screen_name.pascalCase()}}Screen]
  const {{screen_name.pascalCase()}}Screen ({
    super.key,
    WidgetModelFactory wmFactory = default{{screen_name.pascalCase()}}WMFactory,
  }) : super(wmFactory);

  @override
  Widget build(I{{screen_name.pascalCase()}}WM wm) {
    return const Placeholder();
  }
}
