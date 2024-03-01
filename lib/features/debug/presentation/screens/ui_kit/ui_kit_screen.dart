import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/debug/presentation/screens/ui_kit/ui_kit_wm.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_names.dart';
import 'package:flutter_template/l10n/app_localizations_x.dart';
import 'package:flutter_template/uikit/colors/color_scheme.dart';

/// {@template ui_kit_screen.class}
/// UI-kit screen.
/// {@endtemplate}
@RoutePage(name: AppRouteNames.uiKitScreen)
class UiKitScreen extends ElementaryWidget<IUiKitWM> {
  /// {@macro ui_kit_screen.class}
  const UiKitScreen({
    Key? key,
    WidgetModelFactory wmFactory = uiKitScreenWMFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IUiKitWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wm.l10n.uiKitScreenTitle),
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: wm.switchTheme,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.light_mode_outlined),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            style: TextStyle(
              color: wm.colorScheme.onBackground,
            ),
            decoration: InputDecoration(
              labelText: wm.l10n.uiKitScreenTextFieldLabel,
              labelStyle: TextStyle(color: wm.colorScheme.textFieldLabel),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: wm.colorScheme.frameTextFieldSecondary),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: wm.colorScheme.frameTextFieldSecondary),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: wm.colorScheme.primary),
              ),
              fillColor: wm.colorScheme.background,
              filled: true,
            ),
          ),
          Card(
            color: wm.colorScheme.surface,
            child: ListTile(
              title: Text(
                wm.l10n.uiKitScreenCardText,
                style: TextStyle(color: wm.colorScheme.onSurface),
              ),
            ),
          ),
          Text(
            wm.l10n.uiKitScreenText,
            style: TextStyle(color: wm.colorScheme.onBackground),
          ),
          ElevatedButton(
            onPressed: wm.onPrimaryButtonPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: wm.colorScheme.primary,
              foregroundColor: wm.colorScheme.onPrimary,
            ),
            child: Text(wm.l10n.uiKitScreenPrimaryButtonText),
          ),
          ElevatedButton(
            onPressed: wm.onSecondaryButtonPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: wm.colorScheme.secondary,
              foregroundColor: wm.colorScheme.onSecondary,
            ),
            child: Text(wm.l10n.uiKitScreenSecondaryButtonText),
          ),
          ElevatedButton(
            onPressed: wm.onTertiaryButtonPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: wm.colorScheme.backgroundTertiary,
              foregroundColor: wm.colorScheme.onBackground,
            ),
            child: Text(wm.l10n.uiKitScreenTertiaryButtonText),
          ),
          ElevatedButton(
            onPressed: wm.onTetradicButtonPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: wm.colorScheme.tetradicBackground,
              foregroundColor: wm.colorScheme.onBackground,
            ),
            child: Text(wm.l10n.uiKitScreenTetradicButtonText),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: wm.onDangerSnackButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: wm.colorScheme.danger,
                    foregroundColor: wm.colorScheme.onDanger,
                  ),
                  child: Text(wm.l10n.uiKitScreenDangerSnackButtonText),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: wm.onPositiveSnackButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: wm.colorScheme.positive,
                    foregroundColor: wm.colorScheme.onPositive,
                  ),
                  child: Text(wm.l10n.uiKitScreenPositiveSnackButtonText),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const _ColorGrid(),
        ]
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: e,
                ))
            .toList(),
      ),
    );
  }
}

class _ColorGrid extends StatelessWidget {
  const _ColorGrid();

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final l10n = context.l10n;

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        _ColorCard(
          colorName: l10n.uiKitScreenColorCardPrimaryName,
          color: colorScheme.primary,
          textColor: colorScheme.onPrimary,
        ),
        _ColorCard(
          colorName: l10n.uiKitScreenColorCardSecondaryName,
          color: colorScheme.secondary,
          textColor: colorScheme.onSecondary,
        ),
        _ColorCard(
          colorName: l10n.uiKitScreenColorCardSurfaceName,
          color: colorScheme.surface,
          textColor: colorScheme.onSurface,
        ),
        _ColorCard(
          colorName: l10n.uiKitScreenColorCardSurfaceSecondaryName,
          color: colorScheme.surfaceSecondary,
          textColor: colorScheme.onSurface,
        ),
        _ColorCard(
          colorName: l10n.uiKitScreenColorCardBackgroundName,
          color: colorScheme.background,
          textColor: colorScheme.onBackground,
        ),
        _ColorCard(
          colorName: l10n.uiKitScreenColorCardBackgroundSecondaryName,
          color: colorScheme.backgroundSecondary,
          textColor: colorScheme.onBackground,
        ),
        _ColorCard(
          colorName: l10n.uiKitScreenColorCardBackgroundTertiaryName,
          color: colorScheme.backgroundTertiary,
          textColor: colorScheme.onBackground,
        ),
        _ColorCard(
          colorName: l10n.uiKitScreenColorCardBackgroundTetradicName,
          color: colorScheme.tetradicBackground,
          textColor: colorScheme.onBackground,
        ),
        _ColorCard(
          colorName: l10n.uiKitScreenColorCardDangerName,
          color: colorScheme.danger,
          textColor: colorScheme.onDanger,
        ),
        _ColorCard(
          colorName: l10n.uiKitScreenColorCardDangerSecondaryName,
          color: colorScheme.dangerSecondary,
          textColor: colorScheme.onDanger,
        ),
        _ColorCard(
          colorName: l10n.uiKitScreenColorCardTextFieldName,
          color: colorScheme.textField,
          textColor: colorScheme.onSurface,
        ),
        _ColorCard(
          colorName: l10n.uiKitScreenColorCardTextFieldLabelName,
          color: colorScheme.textFieldLabel,
          textColor: colorScheme.onSurface,
        ),
        _ColorCard(
          colorName: l10n.uiKitScreenColorCardTextFieldHelperName,
          color: colorScheme.textFieldHelper,
          textColor: colorScheme.onSurface,
        ),
        _ColorCard(
          colorName: l10n.uiKitScreenColorCardFrameTextFieldSecondaryName,
          color: colorScheme.frameTextFieldSecondary,
          textColor: colorScheme.onSurface,
        ),
        _ColorCard(
          colorName: l10n.uiKitScreenColorCardInactiveName,
          color: colorScheme.inactive,
          textColor: colorScheme.onSurface,
        ),
        _ColorCard(
          colorName: l10n.uiKitScreenColorCardPositiveName,
          color: colorScheme.positive,
          textColor: colorScheme.onPositive,
        ),
        _ColorCard(
          colorName: l10n.uiKitScreenColorCardSkeletonPrimaryName,
          color: colorScheme.skeletonPrimary,
          textColor: colorScheme.skeletonOnPrimary,
        ),
        _ColorCard(
          colorName: l10n.uiKitScreenColorCardSkeletonSecondaryName,
          color: colorScheme.skeletonSecondary,
          textColor: colorScheme.onSurface,
        ),
        _ColorCard(
          colorName: l10n.uiKitScreenColorCardSkeletonTertiaryName,
          color: colorScheme.skeletonTertiary,
          textColor: colorScheme.onSurface,
        ),
      ],
    );
  }
}

class _ColorCard extends StatelessWidget {
  final Color color;
  final String colorName;
  final Color textColor;

  const _ColorCard({
    required this.color,
    required this.colorName,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return Card(
      color: color,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ColoredBox(
            color: colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
              child: Text(
                colorName,
                textAlign: TextAlign.center,
                style: TextStyle(color: colorScheme.onSurface, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
