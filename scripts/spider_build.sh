if [ "$(basename "$PWD")" = 'script' ]; then cd ..; fi

fvm flutter pub run spider build &&
  fvm dart format .