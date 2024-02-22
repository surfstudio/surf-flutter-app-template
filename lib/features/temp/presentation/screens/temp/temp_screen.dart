import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/common/utils/sizes/app_sizes.dart';
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
                onTap: wm.switchTheme,
                behavior: HitTestBehavior.opaque,
                child: const Padding(
                  padding: EdgeInsets.all(AppSizes.double8),
                  child: Icon(Icons.light_mode_outlined),
                ),
              ),
            ],
          ),
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            items: wm.navigationBarItems,
            onTap: tabsRouter.setActiveIndex,
            currentIndex: tabsRouter.activeIndex,
          ),
        );
      },
    );
  }
}
