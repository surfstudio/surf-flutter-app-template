import 'package:flutter_template/features/common/entity/failure/server/server.dart';

/// The server reported that the user is not authorized.
class UnauthorizedFailure extends ServerFailure {
  @override
  String toString() => 'UnauthorizedFailure';
}
