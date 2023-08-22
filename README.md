# Template information section ← *needs to be removed after template initialization*

A project initialization template adopted at [Surf](https://surfstudio.ru).

## Requirements

Flutter version >=3.0.0 <4.0.0

## Template initialization

Do the following to initialize a project:

1. Search for `flutter_template` and replace it with the name of your project where needed.
2. Initialize `FirebaseCrashlytics` (you can find that in `TODO(init-project)`).
3. Install the actual Flutter version with FVM.
4. Run this command to get up-to-date versions of dependencies:
```sh
fvm flutter pub get --enforce-lockfile
```

## Workflow in the template repository

The rules for branches, commits, and pull requests are the same as for a project repository workflow and are explained below.

> [!IMPORTANT]
> Enter the application name below and delete this alert.

# Application name

## Flutter Version Management (FVM)

### FVM workflow

Installation and IDE configuration for working with FVM are described [here](https://fvm.app/docs/getting_started/installation/) and [here](https://fvm.app/docs/getting_started/configuration).

For VSCode IDE you can also run the [`fvm_vscode.sh` script](scripts/fvm_vscode.sh):
```sh
sh script/fvm_vscode.sh
```

The `fvm install` command will install the project version of Flutter.

You need to use `flutter fvm ...` everywhere instead of just `flutter ...` when working with the project and have a different version of Flutter installed in PATH.

### Flutter and Dart FVM versions of the project

> [!IMPORTANT]
> Change Flutter and Dart versions below and delete this alert.

Flutter: ***3.13*** / Dart SDK: ***3.1***

## Code generation

Basic command for code generation:
```sh
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

### Assets codegen

You can easily add assets to your project by following these steps:
1. Add asset to your assets' folder (make sure you specify this folder in `asset` section of your [pubspec.yaml](pubspec.yaml))
2. Run script [`spider_build.sh`](scripts/spider_build.sh):
   ```sh
   sh scripts/spider_build.sh
   ```

Initially, the project has two groups of assets: 
- [Images](lib/assets/res/images.dart),
- [Svg Icons](lib/assets/res/svg_icons.dart).

You can change it in spider [configuration file](spider.yaml).

> [!IMPORTANT]
> Add relevant information such as:
> - API models and services generation (basic info about SurfGen is [here](docs/surf_gen.md))
> - generating something else that is necessary for work or project launch
>
> Delete this alert after initialization of the template.

## Requirements for running the app

> [!IMPORTANT]
> Add relevant information such as:
> - VPN settings for development
> - test/development accounts
>
> Or just put "No". 
> Delete this alert, but don't delete this section.

## Certs and secrets

iOS certs and profiles should be saved here: `ios/certs`.

DO NOT STORE CERTIFICATES IN THE PROJECT REPOSITORY.

## Workflow in a repository

### Branching in a repository

For each task, a branch is created according to the pattern specified below.
- task branch: `JIRA-<task_number>_<description>` => `JIRA-1234_add_new_screen`

If you want to make changes to the code base outside the task, or if you don't want the change to be executed as a task, then a branch is created according to the pattern:
- branch without a task: `no-task-<type>([context])_<description>` => `no-task-fix(ABC-1)_fix_error_state`

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









===================================================================================================

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



### DI

[Provider](https://pub.dev/packages/provider) is our choice for DI.

Dependencies are grouped into container entities with an interface describing a set of dependencies supplied. This entity is, in turn, supplied to a functionality with a [DiScope](./lib/features/common/widgets/di_scope/di_scope.dart) widget, which is used as a wrapper for a corresponding functionality.

For example, [AppScope](./lib/features/app/di/app_scope.dart) is the base entity for the entire app. It contains dependencies that function through the entire lifecycle of the app. We wrap the whole app in the DiScope and pass a factory that returns the AppScope.
If a functionality needs some dependencies specific to it only, they are isolated into a separate entity, which is to be wrapped around the functionality.

### Localization

The basic rules and tips for working with localization are described in [README.md](./lib/l10n/README.md).
More information on working with localization can be found here `[here](https://docs.flutter.dev/accessibility-and-localization/internationalization).


### Implementation examples

[An example](https://github.com/surfstudio/surf-flutter-app-template-example) of using the template in navigation

### Icons launcher

The basic rules and tips for working with icon generation are described in the [guide](docs/icons_launcher.md).

### Native splash screen

Basic guidelines for creating a native splash screen are [here](docs/splash.md).
