# SharedPreferences

SharedPreferences is a simple way to store and retrieve small data, such as settings, states, or user preferences.

## Using as a Dependency

For clearer and more predictable dependency management, pass the SharedPreferences instance through constructors
of classes or repositories. Here's an example of how you can do this:

```dart
/// Repository for working with first app status
class FirstRunStorageImpl implements IFirstRunStorage {
  /// First run app key
  static const _firstRunAppKey = 'first_run';
  final SharedPreferences _prefs;

  /// Create an instance [FirstRunStorageImpl]
  const FirstRunStorageImpl(this._prefs);

  @override
  bool getIsFirstRun() {
    return _prefs.getBool(_firstRunAppKey) ?? true;
  }

  @override
  Future<void> setIsFirstRun({required bool value}) async {
    await _prefs.setBool(_firstRunAppKey, value);
  }
}
```

You can obtain an instance of SharedPreferences in the AppScope:

```dart
final appDependencies = context.read<IAppScope>();
final firstRunStorage = FirstRunStorageImpl(appDependencies.sharedPreferences);
```

## Write data

```dart
// Obtain shared preferences.
final SharedPreferences prefs = await SharedPreferences.getInstance();

// Save an integer value to 'counter' key.
await prefs.setInt('counter', 10);
// Save an boolean value to 'repeat' key.
await prefs.setBool('repeat', true);
// Save an double value to 'decimal' key.
await prefs.setDouble('decimal', 1.5);
// Save an String value to 'action' key.
await prefs.setString('action', 'Start');
// Save an list of strings to 'items' key.
await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);
```

## Read data

```dart
// Try reading data from the 'counter' key. If it doesn't exist, returns null.
final int? counter = prefs.getInt('counter');
// Try reading data from the 'repeat' key. If it doesn't exist, returns null.
final bool? repeat = prefs.getBool('repeat');
// Try reading data from the 'decimal' key. If it doesn't exist, returns null.
final double? decimal = prefs.getDouble('decimal');
// Try reading data from the 'action' key. If it doesn't exist, returns null.
final String? action = prefs.getString('action');
// Try reading data from the 'items' key. If it doesn't exist, returns null.
final List<String>? items = prefs.getStringList('items');
```

## Remove an entry

```dart
// Remove data for the 'counter' key.
await prefs.remove('counter');
```

Read more [here](https://pub.dev/packages/shared_preferences).
