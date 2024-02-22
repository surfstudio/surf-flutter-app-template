/// {@template converter.class}
/// Base class for converters
/// {@endtemplate}
abstract base class Converter<TResult, TFrom> {
  /// {@macro converter.class}
  const Converter();

  /// Convert TFrom to TResult
  TResult convert(TFrom from);

  /// Convert nullable TFrom to nullable TResult
  TResult? convertNullable(TFrom? from) => from != null ? convert(from) : null;

  /// Convert TFrom list to TResult list
  Iterable<TResult> convertMultiple(Iterable<TFrom> fromList) => fromList.map(convert);
}
