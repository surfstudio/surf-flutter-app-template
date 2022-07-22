import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/navigation/service/router.dart';
import 'package:flutter_template/features/temp/screens/temp_screen/temp_screen_widget_model.dart';

/// Initialization screens (this can be a HomeScreen or SplashScreen for example).
class TempScreen extends ElementaryWidget<TempScreenWidgetModel> {
  /// Create an instance [TempScreen].
  const TempScreen({
    Key? key,
    WidgetModelFactory wmFactory = initScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(TempScreenWidgetModel wm) {
    return AutoTabsScaffold(
      homeIndex: 0,
      routes: [
        CounterScreenRoute(),
        const DebugScreenRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == tabsRouter.activeIndex && tabsRouter.stack.length > 1) {
            tabsRouter.stackRouterOfIndex(index)?.popUntilRoot();
            return;
          }

          tabsRouter.setActiveIndex(index);
        },
        currentIndex: tabsRouter.activeIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Counter',
            icon: Icon(Icons.exposure_plus_1),
          ),
          BottomNavigationBarItem(
            label: 'Debug',
            icon: Icon(Icons.adb),
          ),
        ],
      ),
    );
  }
}
