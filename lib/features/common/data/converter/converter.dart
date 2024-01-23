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

  /// Convert list of TFrom to list of TResult
  Iterable<TResult> convertMultiple(Iterable<TFrom> dtoList) => dtoList.map(convert);
}
