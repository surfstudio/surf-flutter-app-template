import 'package:flutter/foundation.dart';

/// Additional application settings in debug mode.
class DebugOptions {
  /// Settings instance for Device Preview feature
  final ValueNotifier<DevicePreviewSettings> devicePreviewSettings =
      ValueNotifier(DevicePreviewSettings());

  /// Create an instance [DebugOptions].
  DebugOptions();
}

/// Settings for testing how app looks on different devices / aspect ratios
class DevicePreviewSettings {
  /// Turns on / off Device Preview feature
  final bool isDevicePreviewEnabled;

  /// Shows / hides Device Preview bottom menu
  final bool isDevicePreviewToolbarVisible;

  /// Default constructor for Device Preview Settings
  DevicePreviewSettings({
    this.isDevicePreviewEnabled = false,
    this.isDevicePreviewToolbarVisible = false,
  });

  /// Standard copyWith realization
  DevicePreviewSettings copyWith({
    bool? isDevicePreviewEnabled,
    bool? isDevicePreviewToolbarVisible,
  }) =>
      DevicePreviewSettings(
        isDevicePreviewEnabled: isDevicePreviewEnabled ?? this.isDevicePreviewEnabled,
        isDevicePreviewToolbarVisible:
            isDevicePreviewToolbarVisible ?? this.isDevicePreviewToolbarVisible,
      );
}
