import 'package:flutter_template/common/utils/disposable_object/disposable_object.dart';
import 'package:flutter_template/common/utils/disposable_object/i_disposable_object.dart';
import 'package:flutter_template/features/info/data/repositories/info_repository.dart';
import 'package:flutter_template/features/info/domain/repositories/i_info_repository.dart';

/// {@template info_scope.class}
/// Dependencies scope of Info module.
/// {@endtemplate}
final class InfoScope extends DisposableObject implements IInfoScope {
  @override
  final IInfoRepository infoRepository;

  /// Factory constructor for [InfoScope].
  factory InfoScope.create() {
    return InfoScope(const InfoRepository());
  }

  /// {@macro info_scope.class}
  InfoScope(this.infoRepository);
}

/// Interface for Info DI Scope.
abstract interface class IInfoScope implements IDisposableObject {
  /// Info repository.
  abstract final IInfoRepository infoRepository;
}
