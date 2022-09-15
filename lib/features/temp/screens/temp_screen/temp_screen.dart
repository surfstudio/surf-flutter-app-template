import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
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
    return AutoTabsRouter.tabBar(
      routes: wm.routes,
      builder: (context, child, controller) {
        final tabsRouter = context.tabsRouter;
        return Scaffold(
          appBar: AppBar(
            title: Text(wm.appBarTitle(context.topRoute)),
          ),
          body: child,
          bottomNavigationBar: wm.isDebugMode
              ? const _SingleBottomNavBarItem()
              : BottomNavigationBar(
                  currentIndex: tabsRouter.activeIndex,
                  onTap: tabsRouter.setActiveIndex,
                  items: wm.navigationBarItems,
                ),
        );
      },
    );
  }
}

class _SingleBottomNavBarItem extends StatelessWidget {
  const _SingleBottomNavBarItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8.0,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.bug_report_outlined,
                color: Theme.of(context).primaryColor,
              ),
              Text(
                'Debug screen',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
