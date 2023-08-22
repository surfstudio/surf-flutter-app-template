# Architecture

> [!NOTE]
> A description of the architectural decisions that were made on the project should be added here.

# Project structure

- [assets](#assets)
  - docs
  - fonts
  - icons
  - images
  - launcher_icon
  - splash
- [docs](#docs)
  - [features](#features)
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
