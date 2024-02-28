import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/urls.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_wm.dart';
import 'package:flutter_template/features/theme/presentation/theme_provider.dart';
import 'package:flutter_template/l10n/app_localizations_x.dart';

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
        openUiKit: wm.openUiKit,
        proxyController: wm.proxyEditingController,
        setThemeMode: wm.setThemeMode,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final ValueListenable<UrlType> urlState;
  final void Function(UrlType?) urlChanged;
  final void Function(UrlType) switchServer;
  final void Function(ThemeMode?) setThemeMode;
  final Function() setProxy;
  final VoidCallback openUiKit;
  final TextEditingController proxyController;

  const _Body({
    required this.urlState,
    required this.urlChanged,
    required this.switchServer,
    required this.setThemeMode,
    required this.setProxy,
    required this.openUiKit,
    required this.proxyController,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
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
            _ThemeCard(setThemeMode: setThemeMode),
            Card(
              child: ListTile(
                onTap: openUiKit,
                title: Text(l10n.debugScreenUikitNavigateButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServerSwitchCard extends StatelessWidget {
  final ValueListenable<UrlType> urlState;
  final void Function(UrlType?) urlChange;
  final void Function(UrlType) switchServer;

  const _ServerSwitchCard({
    required this.urlState,
    required this.urlChange,
    required this.switchServer,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Text(l10n.debugScreenServerSubtitle),
            ValueListenableBuilder<UrlType>(
              valueListenable: urlState,
              builder: (context, urlState, _) {
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
                      onPressed: () => switchServer(urlState),
                      child: Text(
                        l10n.debugScreenServerConnectButton,
                        style: const TextStyle(fontSize: 16),
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
    final l10n = context.l10n;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(l10n.debugScreenProxySubtitle),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(l10n.debugScreenProxyInfo),
            ),
            Column(
              children: <Widget>[
                TextField(
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) {
                    setProxy();
                  },
                  controller: proxyController,
                  decoration: InputDecoration(
                    filled: true,
                    border: const UnderlineInputBorder(),
                    labelText: l10n.debugScreenProxyEditTextLabel,
                  ),
                ),
                MaterialButton(
                  onPressed: setProxy,
                  child: Text(
                    l10n.debugScreenProxyConnectButton,
                    style: const TextStyle(fontSize: 16),
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
  final void Function(ThemeMode?) setThemeMode;

  const _ThemeCard({required this.setThemeMode});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final themeMode = ThemeProvider.watch(context)?.themeMode;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Text(l10n.debugScreenThemeSubtitle),
            Column(
              children: <Widget>[
                RadioListTile<ThemeMode>(
                  groupValue: themeMode,
                  title: Text(l10n.debugScreenThemeLight),
                  value: ThemeMode.light,
                  onChanged: setThemeMode,
                ),
                RadioListTile<ThemeMode>(
                  groupValue: themeMode,
                  title: Text(l10n.debugScreenThemeDark),
                  value: ThemeMode.dark,
                  onChanged: setThemeMode,
                ),
                RadioListTile<ThemeMode>(
                  groupValue: themeMode,
                  title: Text(l10n.debugScreenThemeSystem),
                  value: ThemeMode.system,
                  onChanged: setThemeMode,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
