import 'dart:async';

import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/environment/build_type.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/config/urls.dart';
import 'package:flutter_template/runner.dart';

/// Main entry point of app.
void main() {
  Environment.init(
    buildType: BuildType.debug,
    config: AppConfig(
      url: Urls.testUrl,
    ),
  );

  unawaited(run());
}
