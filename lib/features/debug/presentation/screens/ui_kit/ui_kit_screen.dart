// ignore_for_file: avoid-ignoring-return-values, prefer-extracting-callbacks

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/common/utils/sizes/app_sizes.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_names.dart';
import 'package:flutter_template/uikit/colors/app_color_scheme.dart';
import 'package:provider/provider.dart';

const _int2 = 2;

/// UI-kit screen.
@RoutePage(name: AppRouteNames.uiKitScreen)
class UiKitScreen extends StatelessWidget {
  /// @nodoc.
  const UiKitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Kit'),
        actions: [
          GestureDetector(
            onTap: context.watch<IAppScope>().themeService.switchTheme,
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
              labelText: 'Text Field',
              labelStyle: TextStyle(color: colorScheme.textFieldLabel),
              filled: true,
              fillColor: colorScheme.background,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorScheme.primary),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorScheme.frameTextFieldSecondary),
              ),
              // ignore: no-equal-arguments
              border: OutlineInputBorder(
                borderSide: BorderSide(color: colorScheme.frameTextFieldSecondary),
              ),
            ),
            style: TextStyle(
              color: colorScheme.onBackground,
            ),
          ),
          Card(
            color: colorScheme.surface,
            child: ListTile(
              title: Text(
                'Card',
                style: TextStyle(color: colorScheme.onSurface),
              ),
            ),
          ),
          Text(
            'Text',
            style: TextStyle(color: colorScheme.onBackground),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Primary Button Pressed')),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: colorScheme.onPrimary,
              backgroundColor: colorScheme.primary,
            ),
            child: const Text('Primary Button'),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Secondary Button Pressed')),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: colorScheme.onSecondary,
              backgroundColor: colorScheme.secondary,
            ),
            child: const Text('Secondary Button'),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tertiary Button Pressed')),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: colorScheme.onBackground,
              backgroundColor: colorScheme.backgroundTertiary,
            ),
            child: const Text('Tertiary Button'),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tetradic Button Pressed')),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: colorScheme.onBackground,
              backgroundColor: colorScheme.tetradicBackground,
            ),
            child: const Text('Tetradic Button'),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Danger snack',
                          style: TextStyle(
                            color: colorScheme.onDanger,
                          ),
                        ),
                        backgroundColor: colorScheme.danger,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: colorScheme.onDanger,
                    backgroundColor: colorScheme.danger,
                  ),
                  child: const Text('Danger snack'),
                ),
              ),
              const SizedBox(width: AppSizes.double8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Positive snack',
                          style: TextStyle(
                            color: colorScheme.onPositive,
                          ),
                        ),
                        backgroundColor: colorScheme.positive,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: colorScheme.onPositive,
                    backgroundColor: colorScheme.positive,
                  ),
                  child: const Text('Positive snack'),
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

    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      crossAxisCount: _int2,
      children: [
        _ColorCard(
          color: colorScheme.primary,
          colorName: 'Primary',
          textColor: colorScheme.onPrimary,
        ),
        _ColorCard(
          color: colorScheme.secondary,
          colorName: 'Secondary',
          textColor: colorScheme.onSecondary,
        ),
        _ColorCard(
          color: colorScheme.surface,
          colorName: 'Surface',
          textColor: colorScheme.onSurface,
        ),
        _ColorCard(
          color: colorScheme.surfaceSecondary,
          colorName: 'Surface Secondary',
          textColor: colorScheme.onSurface,
        ),
        _ColorCard(
          color: colorScheme.background,
          colorName: 'Background',
          textColor: colorScheme.onBackground,
        ),
        _ColorCard(
          color: colorScheme.backgroundSecondary,
          colorName: 'Background Secondary',
          textColor: colorScheme.onBackground,
        ),
        _ColorCard(
          color: colorScheme.backgroundTertiary,
          colorName: 'Background Tertiary',
          textColor: colorScheme.onBackground,
        ),
        _ColorCard(
          color: colorScheme.tetradicBackground,
          colorName: 'Tetradic Background',
          textColor: colorScheme.onBackground,
        ),
        _ColorCard(
          color: colorScheme.danger,
          colorName: 'Danger',
          textColor: colorScheme.onDanger,
        ),
        _ColorCard(
          color: colorScheme.dangerSecondary,
          colorName: 'Danger Secondary',
          textColor: colorScheme.onDanger,
        ),
        _ColorCard(
          color: colorScheme.textField,
          colorName: 'Text Field',
          textColor: Colors.black,
        ),
        _ColorCard(
          color: colorScheme.textFieldLabel,
          colorName: 'Text Field Label',
          textColor: Colors.black,
        ),
        _ColorCard(
          color: colorScheme.textFieldHelper,
          colorName: 'Text Field Helper',
          textColor: Colors.black,
        ),
        _ColorCard(
          color: colorScheme.frameTextFieldSecondary,
          colorName: 'Frame Text Field Secondary',
          textColor: Colors.black,
        ),
        _ColorCard(
          color: colorScheme.inactive,
          colorName: 'Inactive',
          textColor: Colors.black,
        ),
        _ColorCard(
          color: colorScheme.positive,
          colorName: 'Positive',
          textColor: colorScheme.onPositive,
        ),
        _ColorCard(
          color: colorScheme.skeletonPrimary,
          colorName: 'Skeleton Primary',
          textColor: colorScheme.skeletonOnPrimary,
        ),
        _ColorCard(
          color: colorScheme.skeletonSecondary,
          colorName: 'Skeleton Secondary',
          textColor: Colors.black,
        ),
        _ColorCard(
          color: colorScheme.skeletonTertiary,
          colorName: 'Skeleton Tertiary',
          textColor: Colors.black,
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
    return Card(
      color: color,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.double8),
          child: ColoredBox(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppSizes.double2, horizontal: AppSizes.double4),
              child: Text(
                colorName,
                style: const TextStyle(color: Colors.black, fontSize: AppSizes.double16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
