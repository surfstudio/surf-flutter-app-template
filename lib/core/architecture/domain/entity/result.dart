import 'package:flutter_template/core/architecture/domain/entity/failure.dart';

/// Type for data mapper function.
typedef DataMapper<R, TData> = R Function(TData value);

/// {@template result.class}
/// Result of a function execution.
///
/// [Result.ok] - named constructor for a successful Result - [Result].
///
/// [Result.failed] - named constructor for Result with error - [ResultFailed].
/// {@endtemplate}
sealed class Result<TData, TErr extends Failure> {
  /// {@macro result.class}
  const Result();

  /// {@macro result.class}
  const factory Result.ok(TData data) = ResultOk;

  /// {@macro result.class}
  const factory Result.failed(TErr failure) = ResultFailed;

  /// Conversion [ResultOk].
  Result<R, TErr> mapResult<R>(DataMapper<R, TData> mapper) {
    return switch (this) {
      ResultOk<TData, TErr>(:final data) => Result.ok(mapper(data)),
      ResultFailed<TData, TErr>(:final failure) => Result.failed(failure),
    };
  }
}

/// {@macro result.class}
final class ResultOk<TData, TErr extends Failure> extends Result<TData, TErr> {
  /// Successful Result data.
  final TData data;

  /// {@macro result.class}
  const ResultOk(this.data);
}

/// {@macro result.class}
final class ResultFailed<TData, TErr extends Failure> extends Result<TData, TErr> {
  /// Failed Result error.
  final TErr failure;

  /// {@macro result.class}
  const ResultFailed(this.failure);
}
