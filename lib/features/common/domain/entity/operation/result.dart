import 'package:flutter_template/features/common/domain/entity/operation/failure.dart';

/// {@template result.class}
/// Result
///
/// [Result.ok] - Named constructor for successful Result - [ResultOk]
///
/// [Result.failed] - Named constructor for Result with error - [ResultFailed]
/// {@endtemplate}
sealed class Result<TData, TErr extends Failure> {
  /// {@macro result.class}
  const Result();

  /// {@macro result.class}
  const factory Result.ok(TData data) = ResultOk;

  /// {@macro result.class}
  const factory Result.failed(TErr failure) = ResultFailed;

  /// Преобразование [ResultOk]
  Result<R, TErr> mapResult<R>(R Function(TData value) mapper) {
    return switch (this) {
      ResultOk<TData, TErr>(:final data) => Result.ok(mapper(data)),
      ResultFailed<TData, TErr>(:final failure) => Result.failed(failure),
    };
  }
}

/// {@macro result.class}
class ResultOk<TData, TErr extends Failure> extends Result<TData, TErr> {
  /// Data
  final TData data;

  /// {@macro result.class}
  const ResultOk(this.data);
}

/// {@macro result.class}
class ResultFailed<TData, TErr extends Failure> extends Result<TData, TErr> {
  /// Error
  final TErr failure;

  /// {@macro result.class}
  const ResultFailed(this.failure);
}
