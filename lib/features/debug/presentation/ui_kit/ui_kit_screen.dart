import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/debug/presentation/ui_kit/ui_kit_wm.dart';
import 'package:flutter_template/l10n/app_localizations_x.dart';
import 'package:flutter_template/uikit/app_sizes.dart';
import 'package:flutter_template/uikit/colors/app_color_scheme.dart';

/// {@template ui_kit_screen.class}
/// UI-kit screen.
/// {@endtemplate}
class UiKitScreen extends ElementaryWidget<IUiKitWM> {
  /// {@macro ui_kit_screen.class}
  const UiKitScreen({
    Key? key,
    WidgetModelFactory wmFactory = uiKitScreenWMFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IUiKitWM wm) {
    final onBackgroundColor = wm.colorScheme.onBackground;

    return Scaffold(
      appBar: AppBar(
        title: Text(wm.l10n.uiKitScreenTitle),
        actions: [
          GestureDetector(
            onTap: wm.switchTheme,
            behavior: HitTestBehavior.opaque,
            child: const Padding(
              padding: EdgeInsets.all(AppSizes.double8),
              child: Icon(Icons.light_mode_outlined),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.double16),
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: wm.l10n.uiKitScreenTextFieldLabel,
              labelStyle: TextStyle(color: wm.colorScheme.textFieldLabel),
              filled: true,
              fillColor: wm.colorScheme.background,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: wm.colorScheme.primary),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: wm.colorScheme.frameTextFieldSecondary),
              ),
            ),
            style: TextStyle(color: onBackgroundColor),
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
            style: TextStyle(color: onBackgroundColor),
          ),
          ElevatedButton(
            onPressed: wm.onPrimaryButtonPressed,
            style: ElevatedButton.styleFrom(
              foregroundColor: wm.colorScheme.onPrimary,
              backgroundColor: wm.colorScheme.primary,
            ),
            child: Text(wm.l10n.uiKitScreenPrimaryButtonText),
          ),
          ElevatedButton(
            onPressed: wm.onSecondaryButtonPressed,
            style: ElevatedButton.styleFrom(
              foregroundColor: wm.colorScheme.onSecondary,
              backgroundColor: wm.colorScheme.secondary,
            ),
            child: Text(wm.l10n.uiKitScreenSecondaryButtonText),
          ),
          ElevatedButton(
            onPressed: wm.onTertiaryButtonPressed,
            style: ElevatedButton.styleFrom(
              foregroundColor: onBackgroundColor,
              backgroundColor: wm.colorScheme.backgroundTertiary,
            ),
            child: Text(wm.l10n.uiKitScreenTertiaryButtonText),
          ),
          ElevatedButton(
            onPressed: wm.onTetradicButtonPressed,
            style: ElevatedButton.styleFrom(
              foregroundColor: onBackgroundColor,
              backgroundColor: wm.colorScheme.tetradicBackground,
            ),
            child: Text(wm.l10n.uiKitScreenTetradicButtonText),
          ),
          const SizedBox(width: AppSizes.double8),
          Text(wm.l10n.uiKitScreenSnackFromScaffoldMessengerText),
          const SizedBox(width: AppSizes.double8),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: wm.onDangerSnackButtonPressed,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: wm.colorScheme.onDanger,
                    backgroundColor: wm.colorScheme.danger,
                  ),
                  child: Text(wm.l10n.uiKitScreenDangerSnackButtonText),
                ),
              ),
              const SizedBox(width: AppSizes.double8),
              Expanded(
                child: ElevatedButton(
                  onPressed: wm.onPositiveSnackButtonPressed,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: wm.colorScheme.onPositive,
                    backgroundColor: wm.colorScheme.positive,
                  ),
                  child: Text(wm.l10n.uiKitScreenPositiveSnackButtonText),
                ),
              ),
            ],
          ),
          const SizedBox(width: AppSizes.double8),
          Text(wm.l10n.uiKitScreenSnackFromSnackQueueText),
          const SizedBox(width: AppSizes.double8),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: wm.onDangerSnackQueueButtonPressed,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: wm.colorScheme.onDanger,
                    backgroundColor: wm.colorScheme.danger,
                  ),
                  child: Text(wm.l10n.uiKitScreenDangerSnackButtonText),
                ),
              ),
              const SizedBox(width: AppSizes.double8),
              Expanded(
                child: ElevatedButton(
                  onPressed: wm.onPositiveSnackQueueButtonPressed,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: wm.colorScheme.onPositive,
                    backgroundColor: wm.colorScheme.positive,
                  ),
                  child: Text(wm.l10n.uiKitScreenPositiveSnackButtonText),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.double16),
          const _ColorGrid(),
        ]
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSizes.double4),
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
    const crossAxisCount = 2;

    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      crossAxisCount: crossAxisCount,
      children: [
        _ColorCard(
          color: colorScheme.primary,
          colorName: l10n.uiKitScreenColorCardPrimaryName,
          textColor: colorScheme.onPrimary,
        ),
        _ColorCard(
          color: colorScheme.secondary,
          colorName: l10n.uiKitScreenColorCardSecondaryName,
          textColor: colorScheme.onSecondary,
        ),
        _ColorCard(
          color: colorScheme.surface,
          colorName: l10n.uiKitScreenColorCardSurfaceName,
          textColor: colorScheme.onSurface,
        ),
        _ColorCard(
          color: colorScheme.surfaceSecondary,
          colorName: l10n.uiKitScreenColorCardSurfaceSecondaryName,
          textColor: colorScheme.onSurface,
        ),
        _ColorCard(
          color: colorScheme.background,
          colorName: l10n.uiKitScreenColorCardBackgroundName,
          textColor: colorScheme.onBackground,
        ),
        _ColorCard(
          color: colorScheme.backgroundSecondary,
          colorName: l10n.uiKitScreenColorCardBackgroundSecondaryName,
          textColor: colorScheme.onBackground,
        ),
        _ColorCard(
          color: colorScheme.backgroundTertiary,
          colorName: l10n.uiKitScreenColorCardBackgroundTertiaryName,
          textColor: colorScheme.onBackground,
        ),
        _ColorCard(
          color: colorScheme.tetradicBackground,
          colorName: l10n.uiKitScreenColorCardBackgroundTetradicName,
          textColor: colorScheme.onBackground,
        ),
        _ColorCard(
          color: colorScheme.danger,
          colorName: l10n.uiKitScreenColorCardDangerName,
          textColor: colorScheme.onDanger,
        ),
        _ColorCard(
          color: colorScheme.dangerSecondary,
          colorName: l10n.uiKitScreenColorCardDangerSecondaryName,
          textColor: colorScheme.onDanger,
        ),
        _ColorCard(
          color: colorScheme.textField,
          colorName: l10n.uiKitScreenColorCardTextFieldName,
          textColor: colorScheme.onSurface,
        ),
        _ColorCard(
          color: colorScheme.textFieldLabel,
          colorName: l10n.uiKitScreenColorCardTextFieldLabelName,
          textColor: colorScheme.onSurface,
        ),
        _ColorCard(
          color: colorScheme.textFieldHelper,
          colorName: l10n.uiKitScreenColorCardTextFieldHelperName,
          textColor: colorScheme.onSurface,
        ),
        _ColorCard(
          color: colorScheme.frameTextFieldSecondary,
          colorName: l10n.uiKitScreenColorCardFrameTextFieldSecondaryName,
          textColor: colorScheme.onSurface,
        ),
        _ColorCard(
          color: colorScheme.inactive,
          colorName: l10n.uiKitScreenColorCardInactiveName,
          textColor: colorScheme.onSurface,
        ),
        _ColorCard(
          color: colorScheme.positive,
          colorName: l10n.uiKitScreenColorCardPositiveName,
          textColor: colorScheme.onPositive,
        ),
        _ColorCard(
          color: colorScheme.skeletonPrimary,
          colorName: l10n.uiKitScreenColorCardSkeletonPrimaryName,
          textColor: colorScheme.skeletonOnPrimary,
        ),
        _ColorCard(
          color: colorScheme.skeletonSecondary,
          colorName: l10n.uiKitScreenColorCardSkeletonSecondaryName,
          textColor: colorScheme.onSurface,
        ),
        _ColorCard(
          color: colorScheme.skeletonTertiary,
          colorName: l10n.uiKitScreenColorCardSkeletonTertiaryName,
          textColor: colorScheme.onSurface,
        ),
      ],
    );
  }
}

class _ColorCard extends StatelessWidget {
  const _ColorCard({
    required this.color,
    required this.colorName,
    required this.textColor,
  });

  final Color color;
  final String colorName;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return Card(
      color: color,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.double8),
          child: ColoredBox(
            color: colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSizes.double1, horizontal: AppSizes.double2),
              child: Text(
                colorName,
                style: TextStyle(color: colorScheme.onSurface),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
