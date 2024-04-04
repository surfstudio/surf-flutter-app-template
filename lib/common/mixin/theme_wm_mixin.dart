import 'package:elementary/elementary.dart';
import 'package:flutter_template/uikit/colors/app_color_scheme.dart';
import 'package:flutter_template/uikit/text/app_text_scheme.dart';

/// A mixin with [AppColorScheme].
/// Used with [WidgetModel] subclasses.
mixin ThemeWMMixin<W extends ElementaryWidget, M extends ElementaryModel> on WidgetModel<W, M>
    implements ThemeIModelMixin {
  late AppColorScheme _colorScheme;
  late AppTextScheme _textScheme;

  @override
  AppColorScheme get colorScheme => _colorScheme;

  @override
  AppTextScheme get textScheme => _textScheme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _colorScheme = AppColorScheme.of(context);
    _textScheme = AppTextScheme.of(context);
  }
}

/// A mixin for [ThemeWMMixin] for get [AppColorScheme].
mixin ThemeIModelMixin implements IWidgetModel {
  /// App color scheme.
  AppColorScheme get colorScheme;

  /// App text style scheme.
  AppTextScheme get textScheme;
}
