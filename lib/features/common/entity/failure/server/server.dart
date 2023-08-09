import 'package:flutter_template/features/common/entity/failure/failure.dart';

/// Base server error.
class ServerFailure extends Failure {
  /// Creates an instance of [ServerFailure].
  const ServerFailure([String? message]) : super(message: message);

  @override
  String toString() => 'ServerFailure';
}
