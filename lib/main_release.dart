import 'package:flutter_template/config/environment/build_type.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/runner.dart';

/// Main entry point of app.
void main() {
  run(const Environment(buildType: BuildType.prod)).ignore();
}
