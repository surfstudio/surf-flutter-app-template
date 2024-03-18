# Architecture

![architecture scheme](/docs/images/architecture.png)

### Presentation

Logic in a presentation layer can be either **Business logic**(Elementary Model) or **UI logic**(Widget Model):
* **Business logic** is the implementation of product requirements for application data. For example, adding an item to the cart when the user clicks on a button.
* **UI logic** is related to how to display UI state on the screen. For example, navigation logic to a screen when the user clicks a button, or showing a snack bar.

### Repository

The repository is designed to abstract the details of data storage. It makes the `ElementaryModel` independent of the specific data source. You need to interact with the repository from the `ElementaryModel` through the interface.

### Dependency rule

It is also necessary to observe the dependency rule - entities on one layer should depend only on neighboring layers, but not on entities on the same layer. For example, one repository should not depend on another repository. The direction of dependencies must also be followed. For example, repository depends on the data source, but not vice versa.

# Сatching errors

The `Result` class is used to catch errors. It allows you to return either a successful result or a failure.

The return type of all repository methods is set as `RequestOperation<T>` - typedef for asynchronous `Result`. Inside the method, if successful, `Result.ok(data)` is returned, and if an error occurs, `Result.failed(failure)` is returned. 
The result of calling the repository method is processed in the `switch` in the `ElementaryModel`.

`Either` was chosen instead of `rethrow` due to the advantages of `Either`, which make the code more reliable and less error-prone:

- The `Result` type lets us explicitly declare success and failure types in the signature of a function or method in Dart.
- We can use pattern matching in the calling code to ensure we handle both cases explicitly.

# Project structure

> - directories in italics are optional and may be present in some cases
> - in {curly braces} there is a directory/file naming pattern

- [assets](#assets)
  - docs
  - fonts
  - icons
  - images
  - launcher_icon
  - splash
- [docs](#docs)
  - [_features_](#features)
- [lib](#lib)
    - api
        - data
        - service
            - {name}
    - assets
        - colors
        - res
        - strings
        - text
        - themes
    - common
    - config
      - environment
    - core
    - features
        - {name/shared}
            - di
            - data
              - repositories *(implementations)*
              - converters
            - domain
                - entities
                - repositories *(interfaces)*
            - presentation

              **if feature contains multiple sub-features**

                - {sub_feature_name}
                    - {sub_feature_name}_widget.dart
                    - {sub_feature_name}_wm.dart
                    - {sub_feature_name}_model.dart
                    - {sub_feature_name}_flow.dart
                - widgets

              **else** 

                - {feature_name}_widget.dart
                - {feature_name}_wm.dart
                - {feature_name}_model.dart
                - {feature_name}_flow.dart
                - widgets

    - l10n
    - persistence
    - util
- [scripts](#scripts)
- [test](#test)
    - assets
    - core
    - features
        - name
            - screens
            - widgets
    - mocks
- [tools](#tools)

## assets

Contains the necessary assets (images, fonts, icons, etc.):

- docs — documentation assets, which are used for documents in /docs folder.
- fonts — fonts of the project.
- icons — SVG icons and images.
- images — PNG, JPG, and other images.
- launcher_icon — launcher icons.
- splash — images for native splash screen.

## docs

Contains documentation for the project.

### features

Folder for specific features documentation.

## lib

The folder has the code of the project and consists of the following folders:

- api — the layer of data and interactions with the Rest API.
- assets — string representation of the necessary assets, themes, colors, and strings.
- common - general purpose files that are not directly related to the project and can be used in other projects. For example, utilities (utils folder), general purpose widgets (widgets folder).
- config — project configuration, e.g., environment.
- core - contains the basic architectural building blocks for each feature in the project.
- features — features used and implemented in the project. It’s the default location of all folders created for particular features, where each folder contains all of the files relevant to this or that feature. The "shared" folder is organized according to the structure of the feature. It contains files that are used in several features and are directly related to the features of the project.

  The structure of features:


  - di — dependency injection containers.
  - data - contains:
    - converters - classes for mapping data from DTO in entity and vice versa. These classes extend the abstract class `Converter`.
    - repositories - repositories relevant to the feature.
  - domain — contains:
    - entities — business data models.
    - repositories — interfaces for repositories relevant to the feature.
  - presentation - contains:

   **if feature contains multiple sub-features**

    - {sub_feature_name} - screens or sub-features relevant to the feature, with each screen or sub-feature in a separate self-titled folder containing the following in separate files:
        - {sub_feature_name}_widget.dart - ElementaryWidget.
        - {sub_feature_name}_wm.dart - WidgetModel.
        - {sub_feature_name}_model.dart - ElementaryModel.
        - {sub_feature_name}_flow.dart - the entry point to the sub-feature.
    - widgets — widgets relevant to the feature.
    
   **else**

    - {feature_name}_widget.dart - ElementaryWidget.
    - {feature_name}_wm.dart - WidgetModel.
    - {feature_name}_model.dart - ElementaryModel.
    - {feature_name}_flow.dart - the entry point to the feature.
    - widgets — widgets relevant to the feature.
  - utils — necessary utilities.
- l10n — localization files.
- persistence — the layer of data and interactions with the database.
- util — utilities used in the project.

#### scripts

Scripts which are used in the project.
The description of the scripts is in the [README.md](/README.md#project-scripts).

#### test

App tests.

#### tools

Scripts and tools for development (e.g., api_generator)
