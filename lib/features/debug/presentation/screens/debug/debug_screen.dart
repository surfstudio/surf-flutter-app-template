import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_wm.dart';
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
        urlState: wm.serverUrlState,
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
  final ValueListenable<Url> urlState;
  final ValueChanged<Url?> urlChanged;
  final ValueChanged<Url> switchServer;
  final ValueChanged<ThemeMode?> setThemeMode;
  final VoidCallback setProxy;
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
  final ValueListenable<Url> urlState;
  final ValueChanged<Url?> urlChange;
  final ValueChanged<Url> switchServer;

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
            ValueListenableBuilder<Url>(
              valueListenable: urlState,
              builder: (context, urlState, _) {
                return Column(
                  children: [
                    ...Url.values.map(
                      (url) => RadioListTile<Url>(
                        groupValue: urlState,
                        title: Text(url.toString()),
                        subtitle: Text(url.value),
                        value: url,
                        onChanged: urlChange,
                      ),
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
  final VoidCallback setProxy;
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
  final ValueChanged<ThemeMode?> setThemeMode;

  const _ThemeCard({required this.setThemeMode});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    // TODO(Evgenia-bit): добавится получение темы из контекста,
    // когда ветка с рефакторингом сервиса темы будет смержена.
    const themeMode = ThemeMode.light;

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
