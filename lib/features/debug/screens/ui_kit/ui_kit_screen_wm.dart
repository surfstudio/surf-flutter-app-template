import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/debug/screens/ui_kit/ui_kit_screen.dart';
import 'package:flutter_template/features/debug/screens/ui_kit/ui_kit_screen_model.dart';

/// Интерфейс [UIKitScreenWm]
abstract class UIKitWm extends IWidgetModel {
  /// Вернуться назад по стеку
  void goBack();
}

/// WidgetModel для UIKitScreen
class UIKitScreenWm extends WidgetModel<UIKitScreen, UIKitScreenModel> implements UIKitWm {
  final StackRouter _router;

  /// Конструктор для инициализации
  UIKitScreenWm({
    required UIKitScreenModel model,
    required StackRouter router,
  })  : _router = router,
        super(model);

  @override
  void goBack() {
    _router.pop();
  }
}

/// Создание дефолтной WidgetModel
UIKitScreenWm defaultUIKitWm(BuildContext context) => UIKitScreenWm(
      model: UIKitScreenModel(),
      router: context.router,
    );
