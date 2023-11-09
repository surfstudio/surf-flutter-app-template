# Testing

## Goldens

To generate golden tests in the project, the [golden_toolkit](https://pub.dev/packages/golden_toolkit) library has been added.

By opening the file [flutter_test_config.dart](test/flutter_test_config.dart), you can configure the strictness of golden comparisons and the set of devices for which they will be generated.

To save time on writing goldens, you can use the function [testWidget](test/core/utils/test_widget.dart). This function allows you to:

- Test the functionality of a widget (e.g., interactions with elements, element presence, etc.), including for `ElementaryWidget`'s.
- Generate goldens for both light and dark themes.

> [!WARNING]
> Always specify the generic type of the widget you are testing (e.g.,`testWidget<TestableScreen>`), as the golden's name generation is based on the widget class name.

Example usage:
```dart
class MockTestableScreenWM extends Mock implements ITestableScreenWM {}

void main() {
  final mockData = MockData('test data');
  final widget = TestableScreen(mockData);
  final wm = MockTestableScreenWM();

  testWidget<TestableScreen>(
    'Test screen',
    widgetBuilder: (_) => widget.build(wm),
    setup: (theme) {
      when(() => wm.data).thenReturn(EntityValueNotifier(mockData));
      when(() => wm.theme).thenReturn(theme);
      when(wm.onSubmitPressed).thenAnswer((_) => Future.value())
      when(wm.onCancelPressed).thenReturn(null);
    },
    test: (tester, theme) async {
        final submitButton = find.widgetWithText(PrimaryButton, CommonStrings.submitButton);
        final cancelButton = find.widgetWithText(SecondaryButton, CommonStrings.cancelButton);
        
        expect(submitButton, findsOneWidget);
        expect(cancelButton, findsOneWidget);
        expect(finder, findsOneWidget);

        await tester.tap(submitButton);
        verify(wm.onSubmitPressed);

        await tester.tap(cancelButton);
        verify(wm.onCancelPressed);
    },
  );

  /// Nothing to test, just want to generate the golden.
  testWidget<TestableScreen>(
    'Test screen - loading',
    widgetBuilder: (_) => widget.build(wm),
    /// Since we are testing a specific widget state, we fill in the [screenState] property.
    screenState: 'loading',
    setup: (theme) {
      when(() => wm.data).thenReturn(EntityValueNotifier.loading());
      when(() => wm.theme).thenReturn(theme);
    }
  );
}
```
