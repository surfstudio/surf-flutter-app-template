import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/features/debug/presentation/debug/debug_wm.dart';
import 'package:flutter_template/features/theme_mode/presentation/widgets/theme_mode_builder.dart';
import 'package:flutter_template/l10n/app_localizations_x.dart';

/// {@template debug_screen.class}
/// Debug screens.
/// {@endtemplate}
class DebugScreen extends ElementaryWidget<IDebugScreenWM> {
  /// {@macro debug_screen.class}
  const DebugScreen({
    Key? key,
    WidgetModelFactory wmFactory = debugScreenWMFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IDebugScreenWM wm) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _ServerSwitchCard(
                urlState: wm.serverUrlState,
                onUrlRadioButtonPressed: wm.onUrlRadioButtonPressed,
                onChangeServerPressed: wm.onChangeServerPressed,
              ),
              _ProxyCard(
                onConnectProxyPressed: wm.onConnectProxyPressed,
                proxyController: wm.proxyEditingController,
              ),
              _ThemeCard(onSetThemeMode: wm.onSetThemeMode),
              Card(
                child: ListTile(
                  onTap: wm.openUiKit,
                  title: Text(wm.l10n.debugScreenUikitNavigateButton),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServerSwitchCard extends StatelessWidget {
  final ValueListenable<Url> urlState;
  final ValueChanged<Url?> onUrlRadioButtonPressed;
  final ValueChanged<Url> onChangeServerPressed;

  const _ServerSwitchCard({
    required this.urlState,
    required this.onUrlRadioButtonPressed,
    required this.onChangeServerPressed,
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
                        onChanged: onUrlRadioButtonPressed,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () => onChangeServerPressed(urlState),
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
  final VoidCallback onConnectProxyPressed;
  final TextEditingController proxyController;

  const _ProxyCard({
    required this.onConnectProxyPressed,
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
                  onPressed: onConnectProxyPressed,
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
  final ValueChanged<ThemeMode?> onSetThemeMode;

  const _ThemeCard({required this.onSetThemeMode});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Text(l10n.debugScreenThemeSubtitle),
            ThemeModeBuilder(
              builder: (_, themeMode) => Column(
                children: <Widget>[
                  RadioListTile<ThemeMode>(
                    groupValue: themeMode,
                    title: Text(l10n.debugScreenThemeLight),
                    value: ThemeMode.light,
                    onChanged: onSetThemeMode,
                  ),
                  RadioListTile<ThemeMode>(
                    groupValue: themeMode,
                    title: Text(l10n.debugScreenThemeDark),
                    value: ThemeMode.dark,
                    onChanged: onSetThemeMode,
                  ),
                  RadioListTile<ThemeMode>(
                    groupValue: themeMode,
                    title: Text(l10n.debugScreenThemeSystem),
                    value: ThemeMode.system,
                    onChanged: onSetThemeMode,
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
