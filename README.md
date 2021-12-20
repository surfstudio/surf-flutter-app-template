# Шаблон

Шаблон для инициализации проекта в [Surf](https://surfstudio.ru).

### Требования

Версия flutter >= 2.5.0

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
            - widgets
    - utils
- scripts
- test
- tools

#### assets

Содержит необходимые ресурсы(картинки, шрифты, иконки).

#### lib - кодовая часть проекта, в ней есть такие папки как:

- api - слой данных и взаимодействия с Rest API. В ней находятся файлы сгенерированные при
  помощи  [SurfGen](https://github.com/surfstudio/SurfGen).
- assets - строковое представление необходимых ресурсов, темы, цвета, строки.
- config - конфигурации проекта, например окружение(environment).
- features - фичи используемые или реализуемые в проекте. В ней создаются папки с названиями
  фич, в которых находятся все, что к этой фиче относится. В папке common находятся сущности расшаренные между несколькими фичами или нужные всему приложению,
  старайтесь избегать добавления туда файлов без четкой необходимости, добавляйте в нее файлы
  только тогда, когда это действительно нужно. Структура фич:
    - di - контейнеры внедрения зависимостей.
    - domain - содержит:
        - entity - бизнес модели данных.
        - repository - репозитории, относящиеся к фиче.
        - mappers - мапперы данные-модель и обратно.
    - service - бизнес логика.
    - screens - экраны, относящиеся к фиче, каждый экран добавляется в отдельную папку с
      названием экрана, в которой отдельными файлами лежат:
        - widget - ElementaryWidget.
        - wm - WidgetModel.
        - model - ElementaryModel.
    - widgets - виджеты, относящиеся к фиче.
- utils - необходимые утилиты.

#### scripts

Скрипты, необходимые для сборки артефакта проекта. Часть скриптов уже добавлена.

#### test

Тесты приложения.

#### tools

Скрипты и туллинг для разработки(например, api_generator).

### Аналитика

##### Подключены:

- [flutter_surf_lint_rules](https://pub.dev/packages/surf_lint_rules)
- [dart_code_metrics](https://pub.dev/packages/dart_code_metrics) ([инструкция](https://jirasurf.atlassian.net/wiki/spaces/FLUT/pages/3369500703)
  по сбору метрик проекта, настройка проекта уже выполнена)

### Архитектура

Используем [Elementary](https://github.com/Elementary-team/flutter-elementary).

### ApiGen

По умолчанию используем [SurfGen](https://github.com/surfstudio/SurfGen).

[Руководство](https://jirasurf.atlassian.net/wiki/spaces/FLUT/pages/3387031634/SurfGen) по инициализации SurfGen на
проекте(часть пунктов уже сделаны, проверьте их актуальность и соберите исполняемый файл(пункт 4)).

[Руководство](https://jirasurf.atlassian.net/wiki/spaces/FLUT/pages/3386572866/SurfGen) по использованию SurfGen на
проекте.

### DI

В качестве DI используем [Provider](https://pub.dev/packages/provider).

Зависимости группируются в сущности-контейнеры с интерфейсом, описывающим набор поставляемых зависимостей. Эта сущность
поставляется функционалу при помощи виджета [DiScope](./lib/features/common/widgets/di_scope/di_scope.dart), в который
оборачивается соответствующий функционал.

Например, [AppScope](./lib/features/app/di/app_scope.dart) - базовая сущность всего приложения, которая содержит
зависимости, живущие все время, все приложение мы оборачиваем в DiScope<IAppScope>
и передаем фабрику возвращающую AppScope.

Если какому-то функционалу нужны зависимости, требующиеся только ему, они выносятся в отдельную сущность, которая будет
оборачивать этот функционал.
