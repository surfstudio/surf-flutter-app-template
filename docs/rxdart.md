### Rx dart

To extend the capabilities of streams in your project, you can use the rx_dart package.
This package provides various stream types:

* BehaviorSubject: This stream retains the latest emitted event and emits it to new subscribers.
  It's useful when you need access to the latest value even for new subscribers. In practice, this is the most commonly
  used type of stream.
* ReplaySubject: Similar to BehaviorSubject, but can also replay a certain number (all or a portion)
  of the latest events to new subscribers.
* PublishSubject: Equivalent to StreamController<T>.broadcast.

```dart
/// You can set an initial value during initialization
final behaviorSubject = BehaviorSubject<int>.seeded(0);
```

Common stream manipulations:

The **combineLatest** method allows you to combine values from multiple streams (up to 9) and create a new
stream that emits updates when any of the source streams change.

```dart
final stream1 = Stream.fromIterable([1, 2, 3]);
final stream2 = Stream.fromIterable([10, 20, 30]);

/// Streams can have different value types
final combinedStream = Rx.combineLatest2(stream1, stream2, (int a, int b) => a + b);

combinedStream.listen((value) {
  print('combineLatest: $value');
});

/// Output:
/// combineLatest: 1A
/// combineLatest: 2A
/// combineLatest: 2B
/// combineLatest: 3B
/// combineLatest: 3C
```
For instance, you can combine a loading state stream with a data stream and return the result as a map.

The **zip** method pairs values from multiple streams (up to 9) together. It creates a new stream that emits
results obtained by combining values at corresponding positions from the source streams.

```dart
final stream1 = Stream.fromIterable([1, 2, 3]);
final stream2 = Stream.fromIterable(['A', 'B', 'C']);

/// Streams can have different value types
final zippedStream = Rx.zip2(stream1, stream2, (intVal, stringVal) {
  return '$intVal$stringVal';
});

zippedStream.listen((value) {
  print('zip: $value');
});

/// Output:
/// zip: 1A
/// zip: 2B
/// zip: 3C
```
The difference between these methods lies in how values from source streams are combined: pairwise (for zip)
or based on the latest values (for combineLatest).

The **concat** method combines multiple streams sequentially, so that values from one stream are emitted before
values from the next stream.

```dart
final stream1 = Stream.fromIterable(['1', '2', '3']);
final stream2 = Stream.fromIterable(['A', 'B', 'C']);

final concatenatedStream = Rx.concat<String>([stream1, stream2]);
concatenatedStream.listen((value) {
  print('Value: $value');
});

/// Output:
/// Value: 1
/// Value: 2
/// Value: 3
/// Value: A
/// Value: B
/// Value: C
```
In this example, Rx.concat combines values from stream1 and stream2 sequentially, emitting all values from stream1
before emitting values from stream2.

Using Rx.concat can be particularly useful when you have multiple asynchronous operations that need to be executed
one after another, and you want to process their results sequentially.

Read more [here](https://pub.dev/packages/rxdart#stream-classes).
