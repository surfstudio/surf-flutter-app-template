import 'package:flutter_template/features/temp/data/repositories/template_repo.dart';
import 'package:flutter_template/features/temp/domain/repositories/i_template_repo.dart';

/// Interface of Template DI Scope.
abstract interface class ITemplateScope {
  /// Template repo.
  abstract final ITemplateRepo templateRepo;
}

/// Dependencies scope of Template module.
class TemplateScope implements ITemplateScope {
  @override
  final ITemplateRepo templateRepo;

  /// @nodoc
  factory TemplateScope.create() {
    return TemplateScope(TemplateRepo());
  }

  /// @nodoc
  TemplateScope(this.templateRepo);
}
