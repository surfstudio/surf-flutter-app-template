import 'package:flutter/foundation.dart';
import 'package:flutter_template/features/common/domain/entity/failures/api_failure.dart';
import 'package:flutter_template/features/common/domain/entity/operation/failure.dart';
import 'package:flutter_template/features/common/service/error_reports/i_error_reports_service.dart';

/// {@template error_reports_service.class}
/// Implementation [IErrorReportsService]
/// {@endtemplate}
final class ErrorReportsService implements IErrorReportsService {
  /// {@macro error_reports_service.class}
  const ErrorReportsService();

  @override
  void recordError(Object e, {StackTrace? trace}) {
    debugPrint('EXCEPTION: $e');
    debugPrint('STACK TRACE: ${trace ?? ''}');
    // TODO(anyone): implement recordError with crashlytics
  }

  @override
  void recordFailure(Failure failure) {
    switch (failure) {
      case final ApiFailure apiFailure:
        recordError(apiFailure.original, trace: apiFailure.trace);
      default:
        final original = failure.original;
        if (original != null) {
          recordError(original, trace: failure.trace);
        }
    }
  }
}
