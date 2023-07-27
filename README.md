# Template

A project initialization template adopted at [Surf](https://surfstudio.ru).

### Requirements

Flutter version >= 3.0.0

## Workflow in a repository

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

### Flavors

#### Android

To add a new flavor, you need to open [`android/app/build.gradle`](android/app/build.gradle) file and find the following code:

```groovy       
       flavorDimensions "release-type"

       productFlavors {
           dev {
               dimension "release-type"
               applicationIdSuffix ".dev"
               versionNameSuffix "-dev"
           }
           prod {
               dimension "release-type"
           }
       }
   
```

You have to add your custom flavor to the `productFlavors` section. For example:

```groovy
       flavorDimensions "release-type"

       productFlavors {
           dev {
               dimension "release-type"
               applicationIdSuffix ".dev"
               versionNameSuffix "-dev"
           }
           prod {
               dimension "release-type"
           }
           qa {
               dimension "release-type"
               applicationIdSuffix ".qa"
               versionNameSuffix "-qa"
           }
       }
```

You also can create directory for your flavor in [`android/app/src`](android/app/src) directory. For example, if you have files that are used only in your flavor (e.g. launch icons, splash, app name, etc), you can create directory `qa` in `android/app/src` and put your files there.


#### iOS

1. Open `Runner.xcworkspace` in Xcode.
2. Create a new configuration file in `ios/Flutter` and name it after your flavor name:
   
   <img src="assets/docs/xcode_config_file_creation_1.png" width="400">

   Make sure that you have `Runner` target selected and your file will be placed in `Flutter` folder:

   <img src="assets/docs/xcode_config_file_creation_2.png" width="400">
<br>

3. Paste the following code into your configuration file:

```
    #include "Pods/Target Support Files/Pods-Runner/Pods-Runner.qa.xcconfig"
    #include "Generated.xcconfig"
    #include "common.xcconfig"

    app_icon_suffix=-qa
    bundle_suffix=.qa
    IDENTIFIER=$(identifier)$(bundle_suffix)
    APP_ICON=$(app_icon)$(app_icon_suffix)
```
> Replace `qa` with your flavor name.

4. Go to `Runner -> Project -> Runner -> Info` and duplicate configurations (Debug, Release, Profile (if you need it)) for your new flavor. Postfix for your new configuration should be the same as your flavor name. In our case it is `qa`. So, we'll have `Debug-qa`, `Release-qa`, `Profile-qa`. You also should set correct configuration files for each of your new configuration. In the end you should have something like this:
   
   <img src="assets/docs/xcode_configuration_duplication.png" width="500">
   
5. Go to `Product -> Scheme -> New scheme...` and create new scheme named after your flavor. Make sure that you have `Runner` target selected. In the end you should have something like this:
   
   <img src="assets/docs/xcode_scheme_creation.png" width="400">

6. Go to `Product -> Scheme -> Edit scheme...` and select correct Build Configuration for each of scheme:
   
    <img src="assets/docs/xcode_scheme_editing.png" width="500">



#### Icons configuration

You also can specify different icons for each flavor. To do this, you need to create file `flutter_launcher_icons-{your_flavor_name}.yaml`. E.g. `flutter_launcher_icons-qa.yaml`. Then you can specify path to images, colors and other options for your flavor (read [more](assets/launcher_icon/README.md) about configuration).

Finally you need to run this command:
```sh
    dart run flutter_launcher_icons
```

#### IDE Configuration

**VSCode**:

Open `.vscode/launch.json` and add following code:
```json
 {
   "name": "Run qa",
   "request": "launch",
   "type": "dart",
   "args": [
      "--flavor",
       "qa"
    ]
  }
```

Now you can launch app with `qa` flavor by clicking on `Run qa` in debug tab:
![Alt text](assets/docs/vs_code_flavor_config.png)

**Android Studio**:

Open `Run/Debug Configurations` and add new `Flutter` configuration. In `Build flavor` field add `qa`:
![Alt text](assets/docs/android_studio_flavor_config.png)


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
