import 'package:flutter_template/features/common/entity/failure/server/server.dart';

/// The server indicated that token refresh has failed.
class RefreshTokenFailure extends ServerFailure {
  /// The code associated with the server error.
  // TODO(anyone): associatedCode
  static const String associatedCode = '400004';

  /// Creates an instance of the failure.
  RefreshTokenFailure([super.message]);

  @override
  String toString() => 'RefreshTokenFailure(message: $message)';
}
