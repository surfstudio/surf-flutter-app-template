# Architecture

![architecture scheme](/docs/images/architecture.png)

### Presentation

Logic in a presentation layer can be either **Business logic**(Elementary Model) or **UI logic**(Widget Model):
* **Business logic** is the implementation of product requirements for application data. For example, adding an item to the cart when the user clicks on a button.
* **UI logic** is related to how to display UI state on the screen. For example, displaying or hiding the load indicator depending on the data load status or showing a snack bar.

### Repository

The repository is designed to abstract the details of data storage. It makes the `ElementaryModel` independent of the specific data source. You need to interact with the repository from the `ElementaryModel` through the interface.

### Dependency rule

It is also necessary to observe the dependency rule - entities on one layer should depend only on neighboring layers, but not on entities on the same layer. For example, one repository should not depend on another repository. The direction of dependencies must also be followed. For example, repository depends on the data source, but not vice versa.

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
    - config
      - environment
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
- config — project configuration, e.g., environment.
- features — features used and implemented in the project. It’s the default location of all folders created for particular features, where each folder contains all of the files relevant to this or that feature. The “common” folder contains entities shared between several features or crucial for the entire app. Try to avoid adding files there unless absolutely necessary. 

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
