# Architecture

> [!NOTE]
> A description of the architectural decisions that were made on the project should be added here.

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
  - domain — contains:
      - entity — business data models.
      - repository — repositories relevant to the feature.
      - mappers — data-to-model (and vice versa) mappers.
  - service — business logic.
  - screens — screens relevant to the feature, with each screen in a separate self-titled folder containing the following in separate files:
      - widget - ElementaryWidget.
      - wm - WidgetModel.
      - model - ElementaryModel.
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
