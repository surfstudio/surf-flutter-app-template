import 'package:elementary/elementary.dart';
import 'package:flutter_template/l10n/app_localizations.dart';

/// Mixin for widget model which provides localization.
mixin LocalizationMixin<W extends ElementaryWidget, M extends ElementaryModel> on WidgetModel<W, M>
    implements ILocalizationMixin {
  @override
  AppLocalizations get l10n => AppLocalizations.of(context)!;
}

/// Mixin for widget model which provides localization.
mixin ILocalizationMixin implements IWidgetModel {
  /// App color scheme.
  AppLocalizations get l10n;
}
