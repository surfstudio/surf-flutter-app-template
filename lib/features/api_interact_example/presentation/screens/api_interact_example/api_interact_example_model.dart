import 'package:elementary/elementary.dart';
import 'package:flutter_template/features/api_interact_example/domain/repositories/i_api_interact_example_repository.dart';
import 'package:flutter_template/features/api_interact_example/presentation/screens/api_interact_example/api_interact_example_screen.dart';

/// {@template api_interact_example_model.class}
/// [ElementaryModel] for [ApiInteractExampleScreen]
/// {@endtemplate}
final class ApiInteractExampleModel extends ElementaryModel {
  final IApiInteractExampleRepository _repository;

  /// {@macro api_interact_example_model.class}
  ApiInteractExampleModel({
    required IApiInteractExampleRepository repository,
    super.errorHandler,
  }) : _repository = repository;
}
