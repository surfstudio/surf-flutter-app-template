import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/urls.dart';
import 'package:flutter_template/features/debug/screens/debug_screen/debug_screen_widget_model.dart';

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
        urlChanged: wm.urlChange,
        switchServer: wm.switchServer,
        setProxy: wm.setProxy,
        proxyController: wm.proxyEditingController,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final ListenableState<UrlType> urlState;
  final void Function(UrlType?) urlChanged;
  final void Function(UrlType) switchServer;
  final Function() setProxy;
  final TextEditingController proxyController;

  const _Body({
    required this.urlState,
    required this.urlChanged,
    required this.switchServer,
    required this.setProxy,
    required this.proxyController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                        style: TextStyle(fontSize: 16.0),
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                    style: TextStyle(fontSize: 16.0),
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
