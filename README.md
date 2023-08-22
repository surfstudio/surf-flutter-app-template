# Template information section

> [!IMPORTANT]
> This section needs to be removed after template initialization.

A project initialization template adopted at [Surf](https://surfstudio.ru).

## Template initialization

Do the following to initialize a project:

1. Specify the name of the application [here](#application-name).
2. Search for `flutter_template` and replace it with the name of your project where needed.
3. Initialize `FirebaseCrashlytics` (you can find that in `TODO(init-project)`).
4. Install a needed Flutter version with FVM using the command:
    ```sh
    fvm use <flutter_version>
    ```
    If FVM is not installed, check [FVM workflow](#fvm-workflow).
5. Specify the Flutter version used in the project [here](#flutter-and-dart-fvm-versions-of-the-project).
6. Run this command to get up-to-date versions of dependencies:
    ```sh
    fvm flutter pub get --enforce-lockfile
    ```
7. Setup labels for issues and pull requests in the repository settings according to the [list](docs/workflow_in_repository.md#list-of-labels-for-pr-and-issues).

## Workflow in the template repository

The rules for branches, commits, and pull requests are the same as for a project repository workflow and explained [here](docs/workflow_in_repository.md).

# Application name

> [!IMPORTANT]
> Enter the application name above and delete this alert.

## Basic information

> [!NOTE]
> Add here basic information about the project, such as:
> - a couple words what the project is about
> - briefly, what technologies are used (BLoC, Riverpod, something specific, etc.)
> - link to Confluence space with all project documentation

## Flutter Version Management (FVM)

### FVM workflow

The project uses [FVM](https://fvm.app/) for Flutter version management.
Installation and IDE configuration for working with FVM are described [here](https://fvm.app/docs/getting_started/installation/) and [here](https://fvm.app/docs/getting_started/configuration).

For installation the project version of Flutter, run the command:
```sh
fvm install
```

For VSCode IDE you can also run the script [`fvm_vscode.sh`](scripts/fvm_vscode.sh):
```sh
sh script/fvm_vscode.sh
```

You need to use `flutter fvm ...` everywhere instead of just `flutter ...` when working with the project.

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
1. Add asset to your assets folder (make sure you specify this folder in `asset` section of your [pubspec.yaml](pubspec.yaml))
2. Run script [`spider_build.sh`](scripts/spider_build.sh):
   ```shell
   sh scripts/spider_build.sh
   ```

Spider configuration file is located [here](spider.yaml).

> [!NOTE]
> Add relevant information such as:
> - API models and services generation (basic info about SurfGen is [here](docs/surf_gen.md))
> - generating something else that is necessary for work or project launch
>
> Delete this alert after initialization of the template.

## Requirements for running the app

> [!NOTE]
> Add relevant information such as:
> - VPN settings for development
> - test/development accounts
>
> Or just put "No". 
> Delete this alert, but don't delete this section.

## Project scripts

All scripts are located in the [scripts](scripts) folder, and their description is below:
- [fvm_vscode.sh](scripts/fvm_vscode.sh) — script for VSCode IDE configuration for working with FVM
- [spider_build.sh](scripts/spider_build.sh) — script for assets codegen

## Certs and secrets

iOS certs and profiles should be saved here: `ios/certs`.

DO NOT STORE CERTIFICATES IN THE PROJECT REPOSITORY.

## Workflow in a repository

The workflow includes the following:
- [Branching in a repository](docs/workflow_in_repository.md#branching-in-a-repository)
- [Commits](docs/workflow_in_repository.md#commits)
- [Merge requests (Pull Requests)](docs/workflow_in_repository.md#merge-requests--pull-requests-)
- [List of labels for PR and issues](docs/workflow_in_repository.md#list-of-labels-for-pr-and-issues)

## Architecture and project structure

Architectural decisions made on the project can be found in this [file](docs/architecture_and_project_structure.md). 
There is also a description of the project structure.

## Analytics

##### Enabled:

- [flutter_surf_lint_rules](https://pub.dev/packages/surf_lint_rules)
- [dart_code_metrics](https://pub.dev/packages/dart_code_metrics) ([guide](https://wiki.surfstudio.ru/pages/viewpage.action?pageId=2408055)
  to gathering project metrics; the project has already been configured)

## Navigation

Navigation is centered around the [AutoRoute](https://pub.dev/packages/auto_route) package. 
We use a class called AppRouter for global navigation around an app and StackRouter for nested navigation. 

Despite the fact that StackRouter could be referred to directly through the context in WidgetModel, it should be passed explicitly to the WidgetModel constructor. With StackRouter used in the context, an effective navigation stack can be obtained and managed in this router. AppRouter, in turn, is stored in the AppScope dependencies and recovered from there.

## DI

[Provider](https://pub.dev/packages/provider) is our choice for DI.

Dependencies are grouped into container entities with an interface describing a set of dependencies supplied. This entity is, in turn, supplied to a functionality with a [DiScope](./lib/features/common/widgets/di_scope/di_scope.dart) widget, which is used as a wrapper for a corresponding functionality.

For example, [AppScope](./lib/features/app/di/app_scope.dart) is the base entity for the entire app. It contains dependencies that function through the entire lifecycle of the app. We wrap the whole app in the DiScope and pass a factory that returns the AppScope.
If a functionality needs some dependencies specific to it only, they are isolated into a separate entity, which is to be wrapped around the functionality.

## Localization

The basic rules and tips for working with localization are described in [guide](docs/localization.md).
More information on working with localization can be found [here](https://docs.flutter.dev/accessibility-and-localization/internationalization).

## Theming

The basic rules and tips for working with theming are described in the [guide](docs/theming.md).

## Icons launcher

The basic rules and tips for working with icon generation are described in the [guide](docs/icons_launcher.md).

## Native splash screen

Basic guidelines for creating a native splash screen are [here](docs/splash.md).

## Additional useful practices

There are some additional useful guides in the [docs](docs) folder:
- [Shared preferences](docs/shared_preferences.md)

