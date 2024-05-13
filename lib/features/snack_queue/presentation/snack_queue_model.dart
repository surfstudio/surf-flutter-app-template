import 'package:elementary/elementary.dart';
import 'package:flutter_template/core/architecture/presentation/base_model.dart';
import 'package:flutter_template/features/snack_queue/presentation/snack_queue_widget.dart';

/// {@template snack_queue_model.class}
/// [ElementaryModel] for [SnackQueueWidget].
/// {@endtemplate}
final class SnackQueueModel extends BaseModel {
  /// {@macro snack_queue_model.class}
  SnackQueueModel({
    required super.logWriter,
  });
}
