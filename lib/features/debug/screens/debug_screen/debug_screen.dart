import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/urls.dart';
import 'package:flutter_template/features/debug/screens/debug_screen/debug_screen_widget_model.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_names.dart';

/// Debug screens.
@RoutePage(
  name: AppRouteNames.debugScreen,
)
class DebugScreen extends ElementaryWidget<IDebugScreenWidgetModel> {
  /// Create an instance [DebugScreen].
  const DebugScreen({
    Key? key,
    WidgetModelFactory wmFactory = debugScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IDebugScreenWidgetModel wm) {
    return Scaffold(
      body: _Body(
        urlState: wm.urlState,
        themeState: wm.themeState,
        urlChanged: wm.urlChange,
        switchServer: wm.switchServer,
        setProxy: wm.setProxy,
        openLogsHistory: wm.openLogsHistory,
        openUiKit: wm.openUiKit,
        saveExampleLog: wm.saveExampleLog,
        proxyController: wm.proxyEditingController,
        setThemeMode: wm.setThemeMode,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final ListenableState<UrlType> urlState;
  final ListenableState<ThemeMode> themeState;
  final void Function(UrlType?) urlChanged;
  final void Function(UrlType) switchServer;
  final void Function(ThemeMode?) setThemeMode;
  final Function() setProxy;
  final VoidCallback openLogsHistory;
  final VoidCallback openUiKit;
  final VoidCallback saveExampleLog;
  final TextEditingController proxyController;

  const _Body({
    required this.urlState,
    required this.themeState,
    required this.urlChanged,
    required this.switchServer,
    required this.setThemeMode,
    required this.setProxy,
    required this.openLogsHistory,
    required this.openUiKit,
    required this.saveExampleLog,
    required this.proxyController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _ServerSwitchCard(
              urlState: urlState,
              urlChange: urlChanged,
              switchServer: switchServer,
            ),
            _ProxyCard(
              setProxy: setProxy,
              proxyController: proxyController,
            ),
            _ThemeCard(
              themeState: themeState,
              setThemeMode: setThemeMode,
            ),
            Card(
              child: ListTile(
                onTap: openUiKit,
                title: const Text('To ui kit screen'),
              ),
            ),
            Card(
              child: Column(
                children: [
                  ListTile(
                    onTap: openLogsHistory,
                    title: const Text('Открыть логи'),
                  ),
                  ListTile(
                    onTap: saveExampleLog,
                    title: const Text('Протестировать запись в логи'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServerSwitchCard extends StatelessWidget {
  final ListenableState<UrlType> urlState;
  final void Function(UrlType?) urlChange;
  final void Function(UrlType) switchServer;

  const _ServerSwitchCard({
    required this.urlState,
    required this.urlChange,
    required this.switchServer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            const Text('Сервер'),
            StateNotifierBuilder<UrlType>(
              listenableState: urlState,
              builder: (context, urlState) {
                return Column(
                  children: <Widget>[
                    RadioListTile<UrlType>(
                      groupValue: urlState,
                      title: Text(UrlType.test.toString()),
                      subtitle: Text(Url.testUrl),
                      value: UrlType.test,
                      onChanged: urlChange,
                    ),
                    RadioListTile<UrlType>(
                      groupValue: urlState,
                      title: Text(UrlType.prod.toString()),
                      subtitle: Text(Url.prodUrl),
                      value: UrlType.prod,
                      onChanged: urlChange,
                    ),
                    RadioListTile<UrlType>(
                      groupValue: urlState,
                      title: Text(UrlType.dev.toString()),
                      subtitle: Text(Url.devUrl),
                      value: UrlType.dev,
                      onChanged: urlChange,
                    ),
                    MaterialButton(
                      onPressed: () => switchServer(urlState!),
                      child: const Text(
                        'Переключить',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ProxyCard extends StatelessWidget {
  final Function() setProxy;
  final TextEditingController proxyController;

  const _ProxyCard({
    required this.setProxy,
    required this.proxyController,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text('Прокси-сервер'),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text('Активирует передачу трафика через прокси сервер.'),
            ),
            Column(
              children: <Widget>[
                TextField(
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) {
                    setProxy();
                  },
                  controller: proxyController,
                  decoration: const InputDecoration(
                    filled: true,
                    border: UnderlineInputBorder(),
                    labelText: 'Адрес прокси сервера',
                  ),
                ),
                MaterialButton(
                  onPressed: setProxy,
                  child: const Text(
                    'Переключить прокси',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeCard extends StatelessWidget {
  final ListenableState<ThemeMode> themeState;
  final void Function(ThemeMode?) setThemeMode;

  const _ThemeCard({
    required this.themeState,
    required this.setThemeMode,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: StateNotifierBuilder<ThemeMode>(
          listenableState: themeState,
          builder: (context, themeState) {
            return Column(
              children: <Widget>[
                const Text('Выбрать тему приложения'),
                Column(
                  children: <Widget>[
                    RadioListTile<ThemeMode>(
                      groupValue: themeState,
                      title: const Text('Light Theme'),
                      value: ThemeMode.light,
                      onChanged: setThemeMode,
                    ),
                    RadioListTile<ThemeMode>(
                      groupValue: themeState,
                      title: const Text('Dark Theme'),
                      value: ThemeMode.dark,
                      onChanged: setThemeMode,
                    ),
                    RadioListTile<ThemeMode>(
                      groupValue: themeState,
                      title: const Text('System Theme'),
                      value: ThemeMode.system,
                      onChanged: setThemeMode,
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
