# Theming

There are three layers of theme we use in our projects:

## Raw resources

By raw resources, we mean raw colors, fonts or assets. 
For example:

```dart
abstract class ColorPalette {
    static const egyptianBlue = Color(0xFF1245AA);
    static const venetianRed = Color(0xFFCC1512);
    // etc...
}
```

> [!WARNING]
> You **should not** use these colors directly in your application. Use it in `ThemeData` or `ThemeExtension` instead.

## ThemeData

This class defines app theme. With this class you can define colors, fonts, text styles, etc. for material widgets.
For example:

```dart
ThemeData(
    primaryColor: ColorPalette.egyptianBlue,
    accentColor: ColorPalette.venetianRed,
    textTheme: TextTheme(
        displayLarge: TextStyle(
            color: ColorPalette.egyptianBlue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
        ),
        // etc...
    ),
)
```

Read more [here](https://api.flutter.dev/flutter/material/ThemeData-class.html).

## ThemeExtension

Meanwhile `ThemeData` defines theme only for material widgets, `ThemeExtension` allows you to define theme with custom fields for your custom widgets.

```dart
@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final Color primary;
  final Color onPrimary;
  final Color dangerBg;
  final Color dangerFg;
  // etc...

  AppColorScheme.light()
      : primary = LightColorPalette.someColor,
      : onPrimary = LightColorPalette.otherColor,
      : dangerBg = LightColorPalette.someRed,
      : dangerFg = LightColorPalette.white,
  // etc.

  AppColorScheme.dark()
      : primary = DarkColorPalette.someColor,
      : onPrimary = DarkColorPalette.otherColor,
      : dangerBg = DarkColorPalette.someRed,
      : dangerFg = DarkColorPalette.white,
  // etc.

  const AppColorScheme._({
    required this.primary,
    required this.onPrimary,
    required this.dangerBg,
    required this.dangerFg,
  });

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? primary
    Color? onPrimary
    Color? dangerBg
    Color? dangerFg
  }) {
    return AppColorScheme(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      dangerBg: dangerBg ?? this.dangerBg,
      dangerFg: dangerFg ?? this.dangerFg,
    );
  }

  /// Method for smooth transition between two themes.
  @override
  ThemeExtension<AppColorScheme> lerp(
      ThemeExtension<AppColorScheme>? other,
      double t,
      ) {
    if (other is! AppColorScheme) {
      return this;
    }

    return AppColorScheme._(
      primary: Color.lerp(primary, other.primary, t),
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t),
      dangerBg: Color.lerp(dangerBg, other.dangerBg, t),
      dangerFg: Color.lerp(dangerFg, other.dangerFg, t),
    );
  }

  /// Returns [AppColorScheme] from [context].
  static AppColorScheme of(BuildContext context) =>
      Theme.of(context).extension<AppColorScheme>()!;
}
```

> [!WARNING]
> It is important that `ThemeExtension` is in sync with `ThemeData` - thanks to this, a smooth theme update for custom extensions is possible.

Read more [here](https://api.flutter.dev/flutter/material/ThemeExtension-class.html).

#### Recommended practices

You can define whatever `ThemeExtension` you want or use only `ThemeData`, but you also can use our semantic [`ColorScheme`](lib/assets/colors/color_scheme.dart).

This scheme is inspired by Material Design and contains colors for primary, secondary, error, background, surface, onPrimary, onSecondary, onBackground, onSurface, onError, etc.

You don't have to use only this set of fields — you can add your own, delete unnecessary, etc.

Example of use:
```dart
class SomeCustomWidget extends StatelessWidget {
  const SomeCustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheme = AppColorScheme.of(context);
    
    return Container(
      color: scheme.surface,
      /// etc...
    );
  }
}
```
