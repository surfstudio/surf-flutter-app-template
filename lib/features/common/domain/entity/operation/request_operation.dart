import 'package:flutter_template/features/common/domain/entity/operation/failure.dart';
import 'package:flutter_template/features/common/domain/entity/operation/result.dart';

/// Typedef for all repository methods
typedef RequestOperation<T> = Future<Result<T, Failure>>;

/// Typedef for Completer
typedef RequestOperationCompleter<T> = Result<T, Failure>;
