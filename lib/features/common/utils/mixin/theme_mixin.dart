import 'package:elementary/elementary.dart';
import 'package:flutter_template/assets/colors/color_scheme.dart';
import 'package:flutter_template/assets/text/text_extention.dart';

/// A mixin with [AppColorScheme].
/// Used with [WidgetModel] subclasses.
mixin ThemeWMMixin<W extends ElementaryWidget, M extends ElementaryModel> on WidgetModel<W, M>
    implements ThemeIModelMixin {
  late AppColorScheme _colorScheme;
  late AppTextTheme _textScheme;

  @override
  AppColorScheme get colorScheme => _colorScheme;

  @override
  AppTextTheme get textScheme => _textScheme;

  @override
  void didChangeDependencies() {
    _colorScheme = AppColorScheme.of(context);
    _textScheme = AppTextTheme.of(context);
  }
}

/// A mixin for [ThemeWMMixin] for get [AppColorScheme].
mixin ThemeIModelMixin implements IWidgetModel {
  /// App color scheme.
  AppColorScheme get colorScheme;

  /// App text style scheme.
  AppTextTheme get textScheme;
}
