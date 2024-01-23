import 'package:flutter_template/features/common/domain/entity/operation/failure.dart';

/// Interface for the error tracking service
abstract interface class IErrorReportsService {
  /// Log error
  void recordError(Object e, {StackTrace? trace});

  /// Log [Failure]
  void recordFailure(Failure failure);
}
