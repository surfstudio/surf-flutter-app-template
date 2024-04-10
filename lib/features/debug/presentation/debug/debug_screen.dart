import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/features/debug/presentation/debug/debug_wm.dart';
import 'package:flutter_template/features/theme_mode/presentation/widgets/theme_mode_builder.dart';
import 'package:flutter_template/l10n/app_localizations_x.dart';
import 'package:flutter_template/uikit/app_sizes.dart';

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
        padding: const EdgeInsets.all(AppSizes.double8),
        child: ListView(
          children: [
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
                title: Text(wm.l10n.debugScreenUikitNavigateButton),
                onTap: wm.openUiKit,
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
    required this.onUrlRadioButtonPressed,
    required this.onChangeServerPressed,
  });

  final ValueListenable<Url> urlState;
  final ValueChanged<Url?> onUrlRadioButtonPressed;
  final VoidCallback onChangeServerPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.double8),
        child: Column(
          children: <Widget>[
            Text(l10n.debugScreenServerSubtitle),
            ValueListenableBuilder<Url>(
              valueListenable: urlState,
              builder: (_, selectedUrl, __) {
                return Column(
                  children: [
                    ...Url.values.map(
                      (url) => RadioListTile<Url>(
                        value: url,
                        groupValue: selectedUrl,
                        onChanged: onUrlRadioButtonPressed,
                        title: Text(url.toString()),
                        subtitle: Text(url.value),
                      ),
                    ),
                    MaterialButton(
                      onPressed: onChangeServerPressed,
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
    required this.onConnectProxyPressed,
    required this.proxyController,
  });

  final VoidCallback onConnectProxyPressed;
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
                ),
                MaterialButton(
                  onPressed: onConnectProxyPressed,
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
  const _ThemeCard({required this.onSetThemeMode});

  final ValueChanged<ThemeMode?> onSetThemeMode;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.double8),
        child: Column(
          children: <Widget>[
            Text(l10n.debugScreenThemeSubtitle),
            ThemeModeBuilder(
              builder: (_, themeMode) => Column(
                children: <Widget>[
                  RadioListTile<ThemeMode>(
                    value: ThemeMode.light,
                    groupValue: themeMode,
                    onChanged: onSetThemeMode,
                    title: Text(l10n.debugScreenThemeLight),
                  ),
                  RadioListTile<ThemeMode>(
                    value: ThemeMode.dark,
                    groupValue: themeMode,
                    onChanged: onSetThemeMode,
                    title: Text(l10n.debugScreenThemeDark),
                  ),
                  RadioListTile<ThemeMode>(
                    value: ThemeMode.system,
                    groupValue: themeMode,
                    onChanged: onSetThemeMode,
                    title: Text(l10n.debugScreenThemeSystem),
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
