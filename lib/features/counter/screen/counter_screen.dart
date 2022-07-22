import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/counter/screen/counter_screen_wm.dart';

/// Экран со счетчиком
class CounterScreen extends ElementaryWidget<CounterScreenWm> {
  /// Конструктор для инициализации
  const CounterScreen({
    WidgetModelFactory<WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel>> wmFactory = defaultCounterWm,
    Key? key,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ICounterWM wm) {
    return Scaffold(
      body: Center(
        child: EntityStateNotifierBuilder<int>(
          listenableEntityState: wm.count,
          builder: (context, count) {
            if (count != null) {
              return Text('Вы нажали $count раз(a)');
            }
            return const SizedBox.shrink();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: wm.increase,
        child: const Icon(Icons.add),
      ),
    );
  }
}
