# Template

A project initialization template adopted at [Surf](https://surfstudio.ru).

### Requirements

Flutter version >= 3.0.0

### Initialization

Do the following to initialize a project:

1. Search for flutter_template and replace it with the name of your project where needed.
2. Initialize FirebaseCrashlytics (you can find that in TODO(init-project)).

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

### Implementation examples

[An example](https://github.com/surfstudio/surf-flutter-app-template-example) of using the template in navigation
