import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/features/debug/domain/entities/url_type_entity.dart';
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
        urlState: wm.urlState,
        themeState: wm.themeState,
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
  final ValueListenable<UrlTypeEntity> urlState;
  final ValueListenable<ThemeMode> themeState;
  final void Function(UrlTypeEntity?) urlChanged;
  final void Function(UrlTypeEntity) switchServer;
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
            _ThemeCard(
              themeState: themeState,
              setThemeMode: setThemeMode,
            ),
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
  final ValueListenable<UrlTypeEntity> urlState;
  final void Function(UrlTypeEntity?) urlChange;
  final void Function(UrlTypeEntity) switchServer;

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
            ValueListenableBuilder<UrlTypeEntity>(
              valueListenable: urlState,
              builder: (context, urlState, _) {
                return Column(
                  children: <Widget>[
                    RadioListTile<UrlTypeEntity>(
                      groupValue: urlState,
                      title: Text(UrlTypeEntity.qa.toString()),
                      subtitle: Text(Url.qaUrl),
                      value: UrlTypeEntity.qa,
                      onChanged: urlChange,
                    ),
                    RadioListTile<UrlTypeEntity>(
                      groupValue: urlState,
                      title: Text(UrlTypeEntity.prod.toString()),
                      subtitle: Text(Url.prodUrl),
                      value: UrlTypeEntity.prod,
                      onChanged: urlChange,
                    ),
                    RadioListTile<UrlTypeEntity>(
                      groupValue: urlState,
                      title: Text(UrlTypeEntity.dev.toString()),
                      subtitle: Text(Url.devUrl),
                      value: UrlTypeEntity.dev,
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
  final ValueListenable<ThemeMode> themeState;
  final void Function(ThemeMode?) setThemeMode;

  const _ThemeCard({
    required this.themeState,
    required this.setThemeMode,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ValueListenableBuilder<ThemeMode>(
          valueListenable: themeState,
          builder: (context, themeState, _) {
            return Column(
              children: <Widget>[
                Text(l10n.debugScreenThemeSubtitle),
                Column(
                  children: <Widget>[
                    RadioListTile<ThemeMode>(
                      groupValue: themeState,
                      title: Text(l10n.debugScreenThemeLight),
                      value: ThemeMode.light,
                      onChanged: setThemeMode,
                    ),
                    RadioListTile<ThemeMode>(
                      groupValue: themeState,
                      title: Text(l10n.debugScreenThemeDark),
                      value: ThemeMode.dark,
                      onChanged: setThemeMode,
                    ),
                    RadioListTile<ThemeMode>(
                      groupValue: themeState,
                      title: Text(l10n.debugScreenThemeSystem),
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
