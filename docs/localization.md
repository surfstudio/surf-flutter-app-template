# Localization

Localization is implemented using the built-in localization methods in Flutter.

## Naming tips

### Use a string assignment as a variable, not a free translation

Good names:

- `"positiveResponse": "Да"`
- `"settingsSubmitButton": "Подтверждаю это"`
- `"mainTitle": "Главный экран"`

Bad names:

- `"yes": "Да"`
- `"approveThis": "Подтверждаю это"`
- `"mainScreen": "Главный экран"`

### Try to use common strings less frequently

Generic strings can save time, but can also be misleading. If you name the strings correctly, this problem will not occur.

## Segment

Segments are required for visual and semantic separation of lines in the .arb file.

It is also recommended to add an empty line before the segment for visual separation.

For the segment, meta-names are used with @:

```
  "@segmentCommon": {
    "---------": "---------",
    "description": "Общие строки"
  },
  "positiveResponse": "Да", 

  "@segmentMain": {
    "---------": "---------",
    "description": "Главный экран"
  },
  ...
```

All lines related to this segment must come after it.

## Naming semantics

Naming pattern: `<segmentName><stringPurpose>`

- `<segmentName>` — the name of the segment under which the line is located
- `<stringPurpose>` — obviously the purpose of the string

Examples:
```
  "@segmentAuth": {
    "---------": "---------",
    "description": "Строки связанные с авторизацией"
  },
  "authLoginTitle": "вход",
  "authUserTextFieldLabel": "почта или номер телефона",
  "authPasswordTextFieldLabel": "пароль",
  ...
```

## How to add a line?

1. According to the rules, add a new line.
2. Make hot reload/restart.
3. The code will be generated in the `.dart_tool/flutter_gen/gen_l10n` temporary folder.

## Plugins for working with localization.

- IntelliJ / Android Studio: [Flutter Intl](https://plugins.jetbrains.com/plugin/13666-flutter-intl)
- VSCode: [Flutter Intl](https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl)
