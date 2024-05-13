# Deeplinking

Deeplinking is optional feature, but you can implement it following guide below

## Setup deeplinks

- Add dependencies

```shell
fvm flutter pub add app_links
```

- Setup for Android
[Flutter guide](https://docs.flutter.dev/cookbook/navigation/set-up-app-links#2-modify-androidmanifest-xml)
[Android guide](https://developer.android.com/training/app-links)

- Setup for iOS
[Flutter guide](https://docs.flutter.dev/cookbook/navigation/set-up-universal-links#2-adjust-ios-build-settings)
[iOS guide](https://developer.apple.com/documentation/xcode/allowing-apps-and-websites-to-link-to-your-content)

## Add deeplink feature

- features/deeplink/domain/deeplink_repository.dart

```dart
/// Repository interface for Deeplink features.
abstract interface class IDeeplinkRepository {
  /// Get initial deeplink as [Uri].
  Future<Uri?> get initialDeeplink;

  /// Get [Stream] of deeplinks as [Uri].
  Stream<Uri> get onDeeplink;
}
```

- features/deeplink/data/deeplink_repository.dart

```dart
/// Implementation of [IDeeplinkRepository].
final class DeeplinkRepository implements IDeeplinkRepository {
  final AppLinks _service;

  /// Default constructor for [DeeplinkRepository].
  const DeeplinkRepository({
    required AppLinks linkService,
  }) : _service = linkService;

  @override
  Future<Uri?> get initialDeeplink => _service.getInitialAppLink();

  @override
  Stream<Uri> get onDeeplink => _service.uriLinkStream;
}
```

- features/deeplink/domain/deeplink_opener.dart

```dart
import 'dart:async';

import 'package:flutter_template/features/navigation/app_router.dart';

/// Class responsible for opening deeplinks and navigating to the appropriate routes.
class DeeplinkOpener {
  final AppRouter _router;

  /// Default constructor for [DeeplinkOpener].
  const DeeplinkOpener({
    required AppRouter router,
  }) : _router = router;

  /// Opens the provided [deeplink] by navigating to the appropriate route.
  Future<void> openDeeplink({
    required Uri deeplink,
  }) async {
    /// Handle the deeplink by navigating to the appropriate route by path.
    await _router.navigateNamed(
      deeplink.path,
      onFailure: (failure) => _router.pushAndPopUntil(
        const DebugRoute(),
        predicate: (route) => false,
      ),
    );
  }
}
```

If you want to handle deeplinks differently you can add more cases here. For example, add code like this to the top of openDeeplink method

```dart
if (deeplink.path.startsWith('/example')) {
    return _handleExampleDeeplink(deeplink);
}
```

And implement custom handling.

- features/deeplink/di/deeplink_scope.dart

```dart
/// Scope of dependencies for Deeplink features.
abstract interface class IDeeplinkScope {
  /// Get [IDeeplinkRepository].
  IDeeplinkRepository get repository;

  /// Get [DeeplinkOpener].
  DeeplinkOpener get deeplinkOpener;
}

/// Implementation of [IDeeplinkScope].
final class DeeplinkScope implements IDeeplinkScope {
  @override
  late final IDeeplinkRepository repository;

  @override
  late final DeeplinkOpener deeplinkOpener;

  /// Default constructor for [DeeplinkScope].
  DeeplinkScope({
    required this.repository,
    required this.deeplinkOpener,
  });

  /// Factory constructor for [DeeplinkScope].
  factory DeeplinkScope.create(
    BuildContext context,
  ) {
    final repository = context.read<IAppScope>().deeplinkRepository;

    final router = context.read<AppRouter>();
    final deeplinkOpener = DeeplinkOpener(router: router);

    return DeeplinkScope(
      repository: repository,
      deeplinkOpener: deeplinkOpener,
    );
  }
}
```

- features/deeplink/presentation/deeplink_flow.dart

```dart
/// Entry point for the Deeplink features.
class DeeplinkFlow extends SingleChildStatelessWidget {
  /// Default constructor for [DeeplinkFlow].
  const DeeplinkFlow({
    super.key,
    super.child,
  });

  @override
  Widget buildWithChild(
    BuildContext context,
    Widget? child,
  ) {
    return DiScope<IDeeplinkScope>(
      factory: DeeplinkScope.create,
      child: DeeplinkWidget(
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}
```

- features/deeplink/presentation/deeplink_model.dart

```dart
/// [ElementaryModel] for Deeplink features.
final class DeeplinkModel extends ElementaryModel {
  final IDeeplinkRepository _repository;
  final DeeplinkOpener _deeplinksOpener;

  /// [Stream] of deeplinks as [Uri].
  Stream<Uri> get onDeeplink => _repository.onDeeplink;

  /// Initial deeplink as [Uri].
  Future<Uri?> get initialDeeplink => _repository.initialDeeplink;

  /// Create an instance of [DeeplinkModel].
  DeeplinkModel({
    required IDeeplinkRepository deeplinkRepository,
    required DeeplinkOpener deeplinkOpener,
  })  : _repository = deeplinkRepository,
        _deeplinksOpener = deeplinkOpener;

  /// Open deeplink.
  void openDeeplink(Uri deeplink) => _deeplinksOpener.openDeeplink(
        deeplink: deeplink,
      );
}
```

- features/deeplink/presentation/deeplink_wm.dart

```dart
/// DI factory for [DeeplinkWM].
DeeplinkWM defaultDeeplinksWMFactory(BuildContext context) {
  final deeplinkScope = context.read<IDeeplinkScope>();

  return DeeplinkWM(
    DeeplinkModel(
      deeplinkRepository: deeplinkScope.repository,
      deeplinkOpener: deeplinkScope.deeplinkOpener,
    ),
  );
}

/// [DeeplinkWM] interface.
abstract interface class IDeeplinkWM with ILocalizationMixin, ThemeIModelMixin implements IWidgetModel {}

/// [WidgetModel] for Deeplink features.
final class DeeplinkWM extends WidgetModel<DeeplinkWidget, DeeplinkModel>
    with LocalizationMixin, ThemeWMMixin
    implements IDeeplinkWM {
  late final StreamSubscription<Uri> _deeplinksSub;

  /// Default constructor for [DeeplinkWM].
  DeeplinkWM(
    super._model,
  );

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _deeplinksSub = model.onDeeplink.listen(_onDeeplink);
    model.initialDeeplink.then(_handleInitialDeeplink);
  }

  void _handleInitialDeeplink(Uri? deeplink) {
    if (deeplink != null) model.openDeeplink(deeplink);
  }

  void _onDeeplink(Uri deeplink) => model.openDeeplink(deeplink);

  @override
  void dispose() {
    _deeplinksSub.cancel();

    super.dispose();
  }
}
```

- features/deeplink/presentation/deeplink_widget.dart

```dart
/// [ElementaryWidget] for Deeplink features.
class DeeplinkWidget extends ElementaryWidget<IDeeplinkWM> {
  /// Child [Widget]
  final Widget child;

  /// Default constructor for [DeeplinkWidget].
  const DeeplinkWidget({
    required this.child,
    super.key,
  }) : super(defaultDeeplinksWMFactory);

  @override
  Widget build(IDeeplinkWM wm) {
    return child;
  }
}
```

## Inject deeplink feature to app

- runner.dart

```dart
  // ...

  final initialDeeplink = await scope.deeplinkRepository.initialDeeplink;
  
  // ...

  runApp(
    AppFlow(
      // ...
      initialDeeplink: initialDeeplink,
      // ...
    ),
  );

  // ...
```

- features/app/app.dart

Update MaterialApp

```dart
    // ..

        return MaterialApp.router(
          // ...
          builder: (context, child) => DeeplinkFlow(
            child: child,
          ),
          // ...
        );
    // ...
```

- features/app/app_flow.dart

Add initialDeeplink field

```dart
  // ...

  /// Initial deeplink that launches the app.
  final Uri? initialDeeplink;
  
  // ...
```

- features/app/di/app_scope.dart

Add deeplink repository to IAppScope

```dart
  // ...

  /// Deeplink repository.
  IDeeplinkRepository get deeplinkRepository;

  // ...
```

And add it to AppScope

```dart
  // ...

  @override
  final IDeeplinkRepository deeplinkRepository;

  // ...

    /// {@macro app_scope.class}
  const AppScope({
    // ...
    required this.deeplinkRepository,
    // ...
  });

  // ...
```

- features/app/di/app_scope_register.dart

```dart
    // ...

    final deeplinkRepository = DeeplinkRepository(linkService: AppLinks());
    
    // ...

    return AppScope(
      // ...
      deeplinkRepository: deeplinkRepository,
      // ...
    );

    // ...
```

## Test deeplinks

- Android

```shell
adb shell am start -a android.intent.action.VIEW \
  -d "sample://your_host.domain/#/feature_example"
```

While in development, for Android 13 and lower you need manually activate links. Go to your app info/settings: Open by default > Add link > (your links should be already filled).

- iOS

```shell
/usr/bin/xcrun simctl openurl booted "app://your_host.domain/#/feature_example"
```
