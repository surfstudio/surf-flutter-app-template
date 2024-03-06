import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/common/utils/logger/i_log_writer.dart';
import 'package:flutter_template/core/architecture/domain/entity/failure.dart';
import 'package:flutter_template/core/architecture/domain/entity/request_operation.dart';
import 'package:flutter_template/core/architecture/domain/entity/result.dart';

/// Typedef for repository method call.
typedef RequestCall<T> = RequestOperation<T> Function();

/// {@template base_model.class}
/// Base class for all [ElementaryModel]s in the application.
/// {@endtemplate}
abstract base class BaseModel extends ElementaryModel {
  /// {@macro i_log_writer.class}
  final ILogWriter logWriter;

  /// {@macro base_model.class}
  BaseModel({required this.logWriter});

  /// Call repository method. All repository calls must be made through this method.
  @protected
  RequestOperation<T> makeCall<T>(RequestCall<T> call) async {
    final result = await call();

    switch (result) {
      case ResultFailed(:final failure):
        _logFailure(failure);
      default:
        break;
    }

    return result;
  }

  void _logFailure(Failure failure) {
    logWriter.failure(failure);
  }
}
