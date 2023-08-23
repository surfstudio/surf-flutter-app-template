import 'package:flutter_template/features/common/entity/failure/server/server.dart';

/// Server error occurs when the server is unresponsive.
class ServerNotResponsingFailure extends ServerFailure {
  @override
  String toString() => 'ServerNotResponsingFailure';
}
