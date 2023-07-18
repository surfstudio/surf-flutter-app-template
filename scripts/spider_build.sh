if [ "$(basename "$PWD")" = 'script' ]; then cd ..; fi

fvm dart pub global activate spider &&
  spider build &&
  fvm dart format .