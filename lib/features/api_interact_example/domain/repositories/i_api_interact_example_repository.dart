import 'package:flutter_template/core/architecture/domain/entity/request_operation.dart';
import 'package:flutter_template/features/api_interact_example/data/repositories/api_interact_example_repository.dart';
import 'package:flutter_template/features/api_interact_example/domain/entities/ip_entity.dart';

/// Interface for [ApiInteractExampleRepository]
///
/// The repository is needed to demonstrate interaction with the api
// ignore: one_member_abstracts
abstract interface class IApiInteractExampleRepository {
  /// Request to get the current IP address.
  RequestOperation<IpEntity> getIp();
}
