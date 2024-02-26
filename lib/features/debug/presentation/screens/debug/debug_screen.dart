import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/urls.dart';
import 'package:flutter_template/features/common/utils/sizes/app_sizes.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_wm.dart';

/// Debug screens.
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
        openUiKit: wm.openUiKit,
        proxyController: wm.proxyEditingController,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final ValueListenable<UrlType> urlState;
  final ValueListenable<ThemeMode> themeState;
  final void Function(UrlType?) urlChanged;
  final void Function(UrlType) switchServer;
  final void Function(ThemeMode?) setThemeMode;
  final Function() setProxy;
  final VoidCallback openUiKit;
  final TextEditingController proxyController;

  const _Body({
    required this.urlState,
    required this.themeState,
    required this.urlChanged,
    required this.switchServer,
    required this.setThemeMode,
    required this.setProxy,
    required this.openUiKit,
    required this.proxyController,
  });

  final ValueListenable<UrlType> urlState;
  final ValueListenable<ThemeMode> themeState;
  final ValueChanged<UrlType?> onUrlChanged;
  final ValueChanged<UrlType> onSwitchServer;
  final ValueChanged<ThemeMode?> onSetThemeMode;
  final VoidCallback onSetProxy;
  final VoidCallback onOpenLogsHistory;
  final VoidCallback onOpenUiKit;
  final VoidCallback onSaveExampleLog;
  final TextEditingController proxyController;

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
          ],
        ),
      ),
    );
  }
}

class _ServerSwitchCard extends StatelessWidget {
  const _ServerSwitchCard({
    required this.urlState,
    required this.onUrlChange,
    required this.onSwitchServer,
  });

  final ValueListenable<UrlType> urlState;
  final ValueChanged<UrlType?> onUrlChange;
  final ValueChanged<UrlType> onSwitchServer;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.double8),
        child: Column(
          children: <Widget>[
            const Text('Сервер'),
            ValueListenableBuilder<UrlType>(
              valueListenable: urlState,
              builder: (_, url, __) {
                return Column(
                  children: <Widget>[
                    RadioListTile<UrlType>(
                      value: UrlType.test,
                      groupValue: url,
                      onChanged: onUrlChange,
                      title: Text(UrlType.test.toString()),
                      subtitle: Text(Urls.testUrl),
                    ),
                    RadioListTile<UrlType>(
                      value: UrlType.prod,
                      groupValue: url,
                      onChanged: onUrlChange,
                      title: Text(UrlType.prod.toString()),
                      subtitle: Text(Urls.prodUrl),
                    ),
                    RadioListTile<UrlType>(
                      value: UrlType.dev,
                      groupValue: url,
                      onChanged: onUrlChange,
                      title: Text(UrlType.dev.toString()),
                      subtitle: Text(Urls.devUrl),
                    ),
                    MaterialButton(
                      onPressed: () => onSwitchServer(url),
                      child: const Text(
                        'Переключить',
                        style: TextStyle(fontSize: AppSizes.double16),
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
  const _ProxyCard({
    required this.onSetProxy,
    required this.proxyController,
  });

  final VoidCallback onSetProxy;
  final TextEditingController proxyController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.double8),
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: AppSizes.double8),
              child: Text('Прокси-сервер'),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: AppSizes.double8),
              child: Text('Активирует передачу трафика через прокси сервер.'),
            ),
            Column(
              children: <Widget>[
                TextField(
                  controller: proxyController,
                  decoration: const InputDecoration(
                    labelText: 'Адрес прокси сервера',
                    filled: true,
                    border: UnderlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) {
                    onSetProxy();
                  },
                ),
                MaterialButton(
                  onPressed: onSetProxy,
                  child: const Text(
                    'Переключить прокси',
                    style: TextStyle(fontSize: AppSizes.double16),
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
  const _ThemeCard({
    required this.themeState,
    required this.onSetThemeMode,
  });

  final ValueListenable<ThemeMode> themeState;
  final ValueSetter<ThemeMode?> onSetThemeMode;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.double8),
        child: ValueListenableBuilder<ThemeMode>(
          valueListenable: themeState,
          builder: (_, theme, __) {
            return Column(
              children: <Widget>[
                const Text('Выбрать тему приложения'),
                Column(
                  children: <Widget>[
                    RadioListTile<ThemeMode>(
                      value: ThemeMode.light,
                      groupValue: theme,
                      onChanged: onSetThemeMode,
                      title: const Text('Light Theme'),
                    ),
                    RadioListTile<ThemeMode>(
                      value: ThemeMode.dark,
                      groupValue: theme,
                      onChanged: onSetThemeMode,
                      title: const Text('Dark Theme'),
                    ),
                    RadioListTile<ThemeMode>(
                      value: ThemeMode.system,
                      groupValue: theme,
                      onChanged: onSetThemeMode,
                      title: const Text('System Theme'),
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
