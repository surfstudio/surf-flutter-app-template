import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/debug/screens/ui_kit/ui_kit_screen_wm.dart';

/// Экран с демонстрацией готовых виджетов приложения
class UIKitScreen extends ElementaryWidget<UIKitScreenWm> {
  /// Конструктор для инициализации
  const UIKitScreen({WidgetModelFactory wmFactory = defaultUIKitWm, Key? key})
      : super(
          wmFactory,
          key: key,
        );

  @override
  Widget build(UIKitWm wm) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: wm.goBack,
        ),
      ),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text('Иконки'),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(Icons.plus_one),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.adb),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text('Виджеты'),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      FloatingActionButton(
                        onPressed: () {},
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
