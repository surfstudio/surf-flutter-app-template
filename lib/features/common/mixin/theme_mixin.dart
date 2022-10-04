import 'package:elementary/elementary.dart';
import 'package:flutter_template/assets/colors/color_scheme.dart';

/// A mixin with [AppColorScheme].
/// Used with [WidgetModel] subclasses.
mixin ThemeWMMixin<W extends ElementaryWidget, M extends ElementaryModel>
    on WidgetModel<W, M> implements ThemeIModelMixin {
  late AppColorScheme _colorScheme;

  @override
  AppColorScheme get colorScheme => _colorScheme;

  @override
  void didChangeDependencies() {
    _colorScheme = AppColorScheme.of(context);
  }
}

/// A mixin for [ThemeWMMixin] for get [AppColorScheme].
mixin ThemeIModelMixin implements IWidgetModel {
  /// App color scheme.
  AppColorScheme get colorScheme;
}
