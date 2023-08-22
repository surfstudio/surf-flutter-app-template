# Template information section ← *needs to be removed after template initialization*

A project initialization template adopted at [Surf](https://surfstudio.ru).

## Requirements

Flutter version >=3.0.0 <4.0.0

## Template initialization

Do the following to initialize a project:

1. Search for `flutter_template` and replace it with the name of your project where needed.
2. Initialize `FirebaseCrashlytics` (you can find that in `TODO(init-project)`).
3. Install the actual Flutter version with FVM.

## Workflow in the template repository

The rules for branches, commits, and pull requests are the same as for the project repository workflow and are explained below.


# Application name ← *put your application name here*

## Flutter Version Management (FVM)

### FVM workflow

Installation and IDE configuration for working with FVM are described [here](https://fvm.app/docs/getting_started/installation/) and [here](https://fvm.app/docs/getting_started/configuration).

The `fvm install` command will install the project version of Flutter.

You need to use `flutter fvm ...` everywhere instead of just `flutter ...` when working with the project and have a different version of Flutter installed in PATH.

### Flutter and Dart FVM versions of the project

Flutter: ***3.10.5*** / Dart SDK: ***3.0.5*** ← *change Flutter and Dart versions here*

## Code generation

Basic command for code generation `fvm flutter pub run build_runner build --delete-conflicting-outputs`.

Add relevant information such as:

- API models and services generation
- assets generation

Or just put "No". Don't delete this section.

## Requirements for running the app

Add relevant information such as:

- VPN settings for development
- test/development accounts

Or just put "No". Don't delete this section.

## Certs and secrets

iOS certs and profiles should be saved here: `ios/certs`.

DO NOT STORE CERTIFICATES IN THE PROJECT REPOSITORY.

Workflow in a repository

### Branching in a repository

For each task, a branch is created according to the pattern specified below.
If you want to make changes to the code base outside the task, or if you don't want the change
to be executed as a task, then a branch is created according to the pattern:

- branch without task: `no-task <type>([context]): <description>`
- task branch: `JIRA-<task_number>_<description>`

### Commits

The [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) is used to create commits.

A pattern for a commit: `<type>(JIRA-<task_number>): <description>`, for example:

- `feat(QWE-1): init_project`
- `fix(XYZ-2): fix_error_state`
- `chore(ABC-3): update CHANGELOG.md`

It is better if the commits will be atomic, then it will be easier to navigate in the history of changes and in the design of PR, the text of the last commit will be automatically substituted in the name of the PR.

### Merge requests (Pull Requests)

For description text, there is a basic template that will be automatically added to the PR description text field.
The template is an mandatory part of the description.
During the creation of a PR, it is highly recommended to describe interesting and complex details, point out bottlenecks if possible, and help the reviewers understand the changes as much as possible.

If PR rules the bug, then in the changes you must additionally describe 2 points. The first is **Root cause**. It is necessary to describe the causes of the bug. The second one is **Solution** here you should describe the algorithm of solving this bug.

`fix(ZXC-4): Buttons are not blocked when loading`

```
Root cause: No UI reaction to load time
Soution: Wrap the screen widget tree in the AbsorbPointer widget. And change the state of this widget based on the loading state.
```

If the work in the current PR is not finished yet, i.e. it does not require an early review, mark it with the flag - **WIP**(Work In Progress) or **Draft**, and remove this flag when the work is finished.

A pattern for a Pull request: `<type>(JIRA-<task_number>): <description>`, for example:

- `feat(QWE-1): init`
- `fix(ASD-2): incorrect text for SocketException`
- `docs(ZXC-2): readme update`

### Initialization

Do the following to initialize a project:

1. Search for flutter_template and replace it with the name of your project where needed.
2. Initialize FirebaseCrashlytics (you can find that in TODO(init-project)).
3. Run this command to get up-to-date versions of dependencies:
   ```sh
   flutter pub get --enforce-lockfile
   ```

### FVM

If you have multiple versions of Flutter installed, you can use [FVM](https://fvm.app/).<br>
You can find installation instructions [here](https://fvm.app/docs/getting_started/installation). <br>
To switch to the desired Flutter version run:
```sh
fvm use <desired_version> # e.g. fvm use 3.10.6
```

Now you need to configure FVM for your IDE:

#### Configuration for VSCode

Follow the [configuration guide](https://fvm.app/docs/getting_started/configuration/#vs-code)
or 
Run the [`fvm_vscode.sh` script](scripts/fvm_vscode.sh):
```sh
sh script/fvm_vscode.sh
```

#### Configuration for AndroidStudio/IDEA

The configuration guide can be found [here](https://fvm.app/docs/getting_started/configuration/#android-studio).

### Structure

- assets
    - fonts
    - icons
    - images
- lib
    - api
        - data
        - service
            - {name}
    - assets
        - res
        - themes
        - colors
        - strings
    - config
    - features
        - {name/common}
            - di
            - domain
                - entity
                - repository
                - mappers
            - service
            - screens
                - {screen_name}
                    - widget
                    - wm
                    - model
            - widgets
    - utils
- scripts
- test
- tools

#### assets

Contains the necessary assets (images, fonts, icons).

#### lib - has the code of the project and consists of the following folders:
  
- api - the layer of data and interactions with the Rest API. Contains the files generated with SurfGen.
- assets - string representation of the necessary assets, themes, colors, and strings.
- config - project configuration, e.g., environment.
- features - features used and implemented in the project. It’s the default location of all folders created for particular features, where each folder contains all of the files relevant to this or that feature. The “common” folder contains entities shared between several features or crucial for the entire app. Try to avoid adding files there unless absolutely necessary. The structure of features:

    - di - dependency injection containers.
    - domain - contains:
        - entity - business data models.
        - repository - repositories relevant to the feature.
        - mappers - data-to-model (and vice versa) mappers.
    - service - business logic.
    - screens - screens relevant to the feature, with each screen in a separate self-titled folder containing the following in separate files:
        - widget - ElementaryWidget.
        - wm - WidgetModel.
        - model - ElementaryModel.
    - widgets - widgets relevant to the feature.
    - utils - necessary utilities.


#### scripts

Scripts necessary to build the project artifact. Some scripts have already been added.

#### test

App tests.

#### tools

Scripts and tools for development (e.g., api_generator)

### Analytics

##### Enabled:

- [flutter_surf_lint_rules](https://pub.dev/packages/surf_lint_rules)
- [dart_code_metrics](https://pub.dev/packages/dart_code_metrics) ([guide](https://wiki.surfstudio.ru/pages/viewpage.action?pageId=2408055)
  to gathering project metrics; the project has already been configured)

### Architecture

The architecture adheres to the rules of Elementary. Screens and parts of the interface having their own logic are defined according to the MVVM pattern. Even though business logic could be implemented directly in the model, the latter only serves as the first point of access to business logic, which is, in turn, implemented in services. Should state management need to be used at the service level, a rock-solid approach—BLoC or Redux—can be implemented and adopted.

### Navigation

Navigation is centered around the [AutoRoute](https://pub.dev/packages/auto_route) package. We use a class called AppRouter for global navigation around an app and StackRouter for nested navigation. Despite the fact that StackRouter could be referred to directly through the context in WidgetModel, it should be passed explicitly to the WidgetModel constructor. With StackRouter used in the context, an effective navigation stack can be obtained and managed in this router. AppRouter, in turn, is stored in the AppScope dependencies and recovered from there.

### ApiGen

[SurfGen](https://github.com/surfstudio/SurfGen) is our default choice.

[Guide](https://wiki.surfstudio.ru/pages/viewpage.action?pageId=2408072) to getting SurfGen up and running on your project (some of the steps have already been made for you, so check if you need to make them and then build an executable file (step 4)).

[Guide](https://wiki.surfstudio.ru/pages/viewpage.action?pageId=2408080) to using SurfGen on your project.

### DI

[Provider](https://pub.dev/packages/provider) is our choice for DI.

Dependencies are grouped into container entities with an interface describing a set of dependencies supplied. This entity is, in turn, supplied to a functionality with a [DiScope](./lib/features/common/widgets/di_scope/di_scope.dart) widget, which is used as a wrapper for a corresponding functionality.

For example, [AppScope](./lib/features/app/di/app_scope.dart) is the base entity for the entire app. It contains dependencies that function through the entire lifecycle of the app. We wrap the whole app in the DiScope and pass a factory that returns the AppScope.
If a functionality needs some dependencies specific to it only, they are isolated into a separate entity, which is to be wrapped around the functionality.

### Localization

The basic rules and tips for working with localization are described in [README.md](./lib/l10n/README.md).
More information on working with localization can be found here `[here](https://docs.flutter.dev/accessibility-and-localization/internationalization).

### Assets codegen

You can easily add assets to your project by following these steps:
1. Add asset to your assets folder (make sure you specify this folder in `asset` section of your [pubspec.yaml](pubspec.yaml))
2. Run script [`spider_build.sh`](scripts/spider_build.sh):
   ```sh
   sh scripts/spider_build.sh
   ```

Initially, the project has two groups of assets - [Images](lib/assets/res/images.dart) and [Svg Icons](lib/assets/res/svg_icons.dart). You can change it in spider [configuration file](spider.yaml).

### Testing

#### Goldens

To generate golden tests in the project, the [golden_toolkit](https://pub.dev/packages/golden_toolkit) library has been added.

By opening the file [flutter_test_config.dart](test/flutter_test_config.dart), you can configure the strictness of golden comparisons and the set of devices for which they will be generated.

To save time on writing goldens, you can use the function [testWidget](test/core/utils/test_widget.dart). This function allows you to:

- Test the functionality of a widget (e.g., interactions with elements, element presence, etc.), including for `ElementaryWidget`'s.
- Generate goldens for both light and dark themes.

**IMPORTANT**: Always specify the generic type of the widget you are testing (e.g.,`testWidget<TestableScreen>`), as the golden's name generation is based on the widget class name.

Example usage:
```dart
class MockTestableScreenWM extends Mock implements ITestableScreenWM {}

void main() {
  final mockData = MockData('test data');
  final widget = TestableScreen(mockData);
  final wm = MockTestableScreenWM();

  testWidget<TestableScreen>(
    'Test screen',
    widgetBuilder: (_) => widget.build(wm),
    setup: (theme) {
      when(() => wm.data).thenReturn(EntityValueNotifier(mockData));
      when(() => wm.theme).thenReturn(theme);
      when(wm.onSubmitPressed).thenAnswer((_) => Future.value())
      when(wm.onCancelPressed).thenReturn(null);
    },
    test: (tester, theme) async {
        final submitButton = find.widgetWithText(PrimaryButton, CommonStrings.submitButton);
        final cancelButton = find.widgetWithText(SecondaryButton, CommonStrings.cancelButton);
        
        expect(submitButton, findsOneWidget);
        expect(cancelButton, findsOneWidget);
        expect(finder, findsOneWidget);

        await tester.tap(submitButton);
        verify(wm.onSubmitPressed);

        await tester.tap(cancelButton);
        verify(wm.onCancelPressed);
    },
  );

  /// Nothing to test, just want to generate the golden.
  testWidget<TestableScreen>(
    'Test screen - loading',
    widgetBuilder: (_) => widget.build(wm),
    /// Since we are testing a specific widget state, we fill in the [screenState] property.
    screenState: 'loading',
    setup: (theme) {
      when(() => wm.data).thenReturn(EntityValueNotifier.loading());
      when(() => wm.theme).thenReturn(theme);
    }
  );
}
```

### Theming

There are three layers of theme we use in our projects:

#### Raw resources

By raw resources we mean raw colors, fonts or assets. For example:

```dart
abstract class ColorPalette {
    static const egyptianBlue = Color(0xFF1245AA);
    static const venetianRed = Color(0xFFCC1512);
    // etc...
}
```

❗❗❗ You **should not** use these colors directly in your application. Use it in `ThemeData` or `ThemeExtension` instead.

#### ThemeData

This class defines app theme. With this class you can define colors, fonts, text styles, etc for material widgets.
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

[Read more](https://api.flutter.dev/flutter/material/ThemeData-class.html).

#### ThemeExtension

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


> It is important that `ThemeExtension` is in sync with `ThemeData` - thanks to this, a smooth theme update for custom extensions is possible.

Read more [here](https://api.flutter.dev/flutter/material/ThemeExtension-class.html).

#### Recommended practices

You can define whatever `ThemeExtension` you want or use only `ThemeData`, but you also can use our semantic [`ColorScheme`](lib/assets/colors/color_scheme.dart).

This scheme inspired by Material Design and contains colors for primary, secondary, error, background, surface, onPrimary, onSecondary, onBackground, onSurface, onError, etc.

You don't have use only this set of fields - you can add your own, delete unnecessary, etc.

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


### Implementation examples

[An example](https://github.com/surfstudio/surf-flutter-app-template-example) of using the template in navigation

### Icons launcher

The basic rules and tips for working with icon generation are described in the [README.md](./assets/launcher_icon/README.md).

### Native splash screen

Basic guidelines for creating a native splash screen [README.md](./assets/splash/README.md)
