if [ "$(basename "$PWD")" = 'script' ]; then cd ..; fi

fvm flutter pub run spider build &&
  fvm dart format . && fvm flutter test --update-goldens test/assets/images_test.dart
