import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/features/common/utils/sizes/app_sizes.dart';
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
        onUrlChanged: wm.urlChange,
        onSwitchServer: wm.switchServer,
        onSetThemeMode: wm.setThemeMode,
        onSetProxy: wm.setProxy,
        onOpenUiKit: wm.openUiKit,
        proxyController: wm.proxyEditingController,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.urlState,
    required this.themeState,
    required this.onUrlChanged,
    required this.onSwitchServer,
    required this.onSetThemeMode,
    required this.onSetProxy,
    required this.onOpenUiKit,
    required this.proxyController,
  });

  final ValueListenable<UrlType> urlState;
  final ValueListenable<ThemeMode> themeState;
  final ValueChanged<UrlType?> onUrlChanged;
  final ValueChanged<UrlType> onSwitchServer;
  final ValueChanged<ThemeMode?> onSetThemeMode;
  final VoidCallback onSetProxy;
  final VoidCallback onOpenUiKit;
  final TextEditingController proxyController;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ListView(
      padding: const EdgeInsets.all(AppSizes.double8),
      children: <Widget>[
        _ServerSwitchCard(
          urlState: urlState,
          onUrlChange: onUrlChanged,
          onSwitchServer: onSwitchServer,
        ),
        _ProxyCard(
          onSetProxy: onSetProxy,
          proxyController: proxyController,
        ),
        _ThemeCard(
          themeState: themeState,
          onSetThemeMode: onSetThemeMode,
        ),
        Card(
          child: ListTile(
            title: Text(l10n.debugScreenUikitNavigateButton),
            onTap: onOpenUiKit,
          ),
        ),
      ],
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
    final l10n = context.l10n;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.double8),
        child: Column(
          children: <Widget>[
            Text(l10n.debugScreenServerSubtitle),
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
                      subtitle: Text(Url.testUrl),
                    ),
                    RadioListTile<UrlType>(
                      value: UrlType.prod,
                      groupValue: url,
                      onChanged: onUrlChange,
                      title: Text(UrlType.prod.toString()),
                      subtitle: Text(Url.prodUrl),
                    ),
                    RadioListTile<UrlType>(
                      value: UrlType.dev,
                      groupValue: url,
                      onChanged: onUrlChange,
                      title: Text(UrlType.dev.toString()),
                      subtitle: Text(Url.devUrl),
                    ),
                    MaterialButton(
                      onPressed: () => onSwitchServer(url),
                      child: Text(
                        l10n.debugScreenServerConnectButton,
                        style: const TextStyle(fontSize: AppSizes.double16),
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
    final l10n = context.l10n;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.double8),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: AppSizes.double8),
              child: Text(l10n.debugScreenProxySubtitle),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: AppSizes.double8),
              child: Text(l10n.debugScreenProxyInfo),
            ),
            Column(
              children: <Widget>[
                TextField(
                  controller: proxyController,
                  decoration: InputDecoration(
                    labelText: l10n.debugScreenProxyEditTextLabel,
                    filled: true,
                    border: const UnderlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) {
                    onSetProxy();
                  },
                ),
                MaterialButton(
                  onPressed: onSetProxy,
                  child: Text(
                    l10n.debugScreenProxyConnectButton,
                    style: const TextStyle(fontSize: AppSizes.double16),
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
    final l10n = context.l10n;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.double8),
        child: ValueListenableBuilder<ThemeMode>(
          valueListenable: themeState,
          builder: (_, theme, __) {
            return Column(
              children: <Widget>[
                Text(l10n.debugScreenThemeSubtitle),
                Column(
                  children: <Widget>[
                    RadioListTile<ThemeMode>(
                      value: ThemeMode.light,
                      groupValue: theme,
                      onChanged: onSetThemeMode,
                      title: Text(l10n.debugScreenThemeLight),
                    ),
                    RadioListTile<ThemeMode>(
                      value: ThemeMode.dark,
                      groupValue: theme,
                      onChanged: onSetThemeMode,
                      title: Text(l10n.debugScreenThemeDark),
                    ),
                    RadioListTile<ThemeMode>(
                      value: ThemeMode.system,
                      groupValue: theme,
                      onChanged: onSetThemeMode,
                      title: Text(l10n.debugScreenThemeSystem),
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
