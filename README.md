# Шаблон

Шаблон проекта, предназначенный для разработки в [Surf](https://surfstudio.ru).

### Внимание

Версия flutter >= 2.8.0

### Архитектура

Используем [Elementary](https://github.com/Elementary-team/flutter-elementary).

### Инициализация

При инициализации проекта нужно:

1. Найти по поиску flutter_template и в нужных местах заменить на название вашего проекта.
2. Проинициализировать FirebaseCrashlytics(найти можно через TODO(init-project)).

### Структура

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
            - widget
    - utils
- scripts
    - android
    - ios
    - version.sh
- test
- tools
    - api_generator

### Аналитика

##### Подключены:

- [flutter_surf_lint_rules](https://pub.dev/packages/surf_lint_rules)
- [dart_code_metrics](https://pub.dev/packages/dart_code_metrics) ([инструкция](https://jirasurf.atlassian.net/wiki/spaces/FLUT/pages/3369500703)
  по сбору метрик проекта, настройка проекта уже выполнена)

### ApiGen

По умолчанию используем [SurfGen](https://github.com/surfstudio/SurfGen).

[Руководство](https://jirasurf.atlassian.net/wiki/spaces/FLUT/pages/3387031634/SurfGen) по инициализации SurfGen на
проекте(Часть пунктов уже сделаны, нужно сделать 4 пункт).

[Руководство](https://jirasurf.atlassian.net/wiki/spaces/FLUT/pages/3386572866/SurfGen) по использованию SurfGen на
проекте.

### DI

В качестве DI используем [Provider](https://pub.dev/packages/provider).

Зависимости группируются в сущности с интерфейсом, которые оборачивают функционал, при помощи [DiScope](./lib/features/common/widgets/di_scope/di_scope.dart).

Например, [AppScope](./lib/features/app/di/app_scope.dart) - базовая сущность всего приложения, которая содержит
зависимости, живущие все время, все приложение мы оборачиваем в DiScope<IAppScope> и передаем фабрику возвращающую
AppScope.

Если какому-то функционалу нужны зависимости, требующиеся только ему, они выносятся в отдельную сущность,
которая будет оборачивать этот функционал.
