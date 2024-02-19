import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/temp/presentation/screens/temp/temp_wm.dart';

/// Initialization screens (this can be a HomeScreen or SplashScreen for example).
class TempScreen extends ElementaryWidget<ITempWidgetModel> {
  /// Create an instance [TempScreen].
  const TempScreen({
    Key? key,
    WidgetModelFactory wmFactory = initScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ITempWidgetModel wm) {
    return AutoTabsRouter.tabBar(
      routes: wm.routes,
      builder: (context, child, controller) {
        final tabsRouter = context.tabsRouter;
        return Scaffold(
          appBar: AppBar(
            title: Text(wm.appBarTitle(context.topRoute)),
            actions: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: wm.switchTheme,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.light_mode_outlined),
                ),
              ),
            ],
          ),
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: wm.navigationBarItems,
          ),
        );
      },
    );
  }
}
