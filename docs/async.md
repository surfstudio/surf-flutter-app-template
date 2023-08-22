# Async package

## Cancelable Operation

To cancel asynchronous operations, the `async` package is used. You can use the `CancelableAsync` class from the
utility folder as a wrapper.

Usage example:

```dart
/// Loading state
final _loadingState = ValueNotifier<bool>(false);
/// Loading data result
String _result = 'Click the Load button';
/// Keep a reference to CancelableOperation here
late final _loadDataCancelable = CancelableAsync<String>();
/// This future will return some text once it completes
Future<String> _loadData() async {
  await Future.delayed(const Duration(seconds: 3));
  return 'Data loaded';
}

/// For UI buttons
///
/// This function is called when the "Load" button is pressed
Future<void> _getData() async {
  _loadingState.value = true;
  _result = await _loadDataCancelable.fetch(_loadData());
  _loadingState.value = false;
}

/// Call this when the "Cancel Load" button is pressed
Future<void> _cancelFuture() async {
  _loadDataCancelable.cancel();
  _loadingState.value = false;
}
```

Example without the wrapper:
```dart
/// Loading state
final _loadingState = ValueNotifier<bool>(false);
/// Loading data result
String _result = 'Click the Load button';
/// Keep a reference to CancelableOperation here
CancelableOperation<String>? _loadDataCancelable;

/// This future will return some text once it completes
Future<String> _loadData() async {
  await Future.delayed(const Duration(seconds: 3));
  return 'Data loaded';
}

/// For UI buttons
///
/// This function is called when the "Load" button is pressed
Future<void> _getData() async {
  await _loadDataCancelable?.cancel();
  _loadingState.value = true;

  /// Since data loading can be canceled, wrap it in CancelableOperation
  _loadDataCancelable = CancelableOperation.fromFuture(
    _loadData(),
    onCancel: () => 'Loading was canceled',
  );

  _result = await _loadDataCancelable?.value ?? 'Click the Load button';
  _loadingState.value = false;
}

/// Call this when the "Cancel Load" button is pressed
Future<void> _cancelFuture() async {
  _result = await _loadDataCancelable?.cancel();
  _loadingState.value = false;
}
```

For more information about the capabilities of the async package, refer to the documentation
[here](https://pub.dev/packages/async).
