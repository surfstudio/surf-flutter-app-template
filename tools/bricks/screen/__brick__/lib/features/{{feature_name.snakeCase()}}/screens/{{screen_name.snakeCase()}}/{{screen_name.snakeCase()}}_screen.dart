import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/{{feature_name.snakeCase()}}/screens/{{screen_name.snakeCase()}}/{{screen_name.snakeCase()}}_wm.dart';


/// {@template {{screen_name.snakeCase()}}_screen.class}
/// [{{screen_name.pascalCase()}}Screen]
/// {@endtemplate}
@RoutePage()
class {{screen_name.pascalCase()}}Screen extends ElementaryWidget<I{{screen_name.pascalCase()}}WM> {
  /// {@macro {{screen_name.snakeCase()}}_screen.class}
  const {{screen_name.pascalCase()}}Screen ({
    super.key,
    WidgetModelFactory wmFactory = default{{screen_name.pascalCase()}}WMFactory,
  }) : super(wmFactory);

  @override
  Widget build(I{{screen_name.pascalCase()}}WM wm) {
    return const Placeholder();
  }
}
