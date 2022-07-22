import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_template/features/counter/screen/counter_screen.dart';
import 'package:flutter_template/features/counter/screen/counter_screen_model.dart';

/// Интерфейс для
abstract class ICounterWM extends IWidgetModel {
  /// Счетчик для экрана
  ListenableState<EntityState<int>> get count;

  /// Увеличение счетчика нажатий
  void increase();
}

/// WidgetModel для CounterScreen
class CounterScreenWm extends WidgetModel<CounterScreen, CounterScreenModel> implements ICounterWM {
  final EntityStateNotifier<int> _count = EntityStateNotifier(const EntityState<int>(data: 0));

  @override
  ListenableState<EntityState<int>> get count => _count;

  /// Конструктор для инициализации
  CounterScreenWm(CounterScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  @override
  void increase() {
    _count.content(++model.number);
  }
}

/// Фабрика для создания дефолтной WidgetModel
CounterScreenWm defaultCounterWm(BuildContext _) => CounterScreenWm(
      CounterScreenModel(),
    );
