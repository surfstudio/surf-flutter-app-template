import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/assets/colors/color_scheme.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_names.dart';
import 'package:provider/provider.dart';

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
            behavior: HitTestBehavior.opaque,
            onTap: context.read<IAppScope>().themeService.switchTheme,
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
              color: colorScheme.onBackground,
            ),
            decoration: InputDecoration(
              labelText: 'Text Field',
              labelStyle: TextStyle(color: colorScheme.textFieldLabel),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: colorScheme.frameTextFieldSecondary),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorScheme.frameTextFieldSecondary),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorScheme.primary),
              ),
              fillColor: colorScheme.background,
              filled: true,
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
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
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
              backgroundColor: colorScheme.secondary,
              foregroundColor: colorScheme.onSecondary,
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
              backgroundColor: colorScheme.backgroundTertiary,
              foregroundColor: colorScheme.onBackground,
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
              backgroundColor: colorScheme.tetradicBackground,
              foregroundColor: colorScheme.onBackground,
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
                        backgroundColor: colorScheme.danger,
                        content: Text(
                          'Danger snack',
                          style: TextStyle(
                            color: colorScheme.onDanger,
                          ),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.danger,
                    foregroundColor: colorScheme.onDanger,
                  ),
                  child: const Text('Danger snack'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: colorScheme.positive,
                        content: Text(
                          'Positive snack',
                          style: TextStyle(
                            color: colorScheme.onPositive,
                          ),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.positive,
                    foregroundColor: colorScheme.onPositive,
                  ),
                  child: const Text('Positive snack'),
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
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        _ColorCard(
          colorName: 'Primary',
          color: colorScheme.primary,
          textColor: colorScheme.onPrimary,
        ),
        _ColorCard(
          colorName: 'Secondary',
          color: colorScheme.secondary,
          textColor: colorScheme.onSecondary,
        ),
        _ColorCard(
          colorName: 'Surface',
          color: colorScheme.surface,
          textColor: colorScheme.onSurface,
        ),
        _ColorCard(
          colorName: 'Surface Secondary',
          color: colorScheme.surfaceSecondary,
          textColor: colorScheme.onSurface,
        ),
        _ColorCard(
          colorName: 'Background',
          color: colorScheme.background,
          textColor: colorScheme.onBackground,
        ),
        _ColorCard(
          colorName: 'Background Secondary',
          color: colorScheme.backgroundSecondary,
          textColor: colorScheme.onBackground,
        ),
        _ColorCard(
          colorName: 'Background Tertiary',
          color: colorScheme.backgroundTertiary,
          textColor: colorScheme.onBackground,
        ),
        _ColorCard(
          colorName: 'Tetradic Background',
          color: colorScheme.tetradicBackground,
          textColor: colorScheme.onBackground,
        ),
        _ColorCard(
          colorName: 'Danger',
          color: colorScheme.danger,
          textColor: colorScheme.onDanger,
        ),
        _ColorCard(
          colorName: 'Danger Secondary',
          color: colorScheme.dangerSecondary,
          textColor: colorScheme.onDanger,
        ),
        _ColorCard(
          colorName: 'Text Field',
          color: colorScheme.textField,
          textColor: Colors.black,
        ),
        _ColorCard(
          colorName: 'Text Field Label',
          color: colorScheme.textFieldLabel,
          textColor: Colors.black,
        ),
        _ColorCard(
          colorName: 'Text Field Helper',
          color: colorScheme.textFieldHelper,
          textColor: Colors.black,
        ),
        _ColorCard(
          colorName: 'Frame Text Field Secondary',
          color: colorScheme.frameTextFieldSecondary,
          textColor: Colors.black,
        ),
        _ColorCard(
          colorName: 'Inactive',
          color: colorScheme.inactive,
          textColor: Colors.black,
        ),
        _ColorCard(
          colorName: 'Positive',
          color: colorScheme.positive,
          textColor: colorScheme.onPositive,
        ),
        _ColorCard(
          colorName: 'Skeleton Primary',
          color: colorScheme.skeletonPrimary,
          textColor: colorScheme.skeletonOnPrimary,
        ),
        _ColorCard(
          colorName: 'Skeleton Secondary',
          color: colorScheme.skeletonSecondary,
          textColor: Colors.black,
        ),
        _ColorCard(
          colorName: 'Skeleton Tertiary',
          color: colorScheme.skeletonTertiary,
          textColor: Colors.black,
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
    return Card(
      color: color,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ColoredBox(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
              child: Text(
                colorName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
