dir=".vscode"
file="settings.json"

if [ ! -d "$dir" ]; then
  mkdir $dir
fi

if [ -d "$dir/$file" ]; then
  rm $dir/$file
fi

json=$(cat <<-END
   {\n
    "dart.flutterSdkPath": ".fvm/flutter_sdk",\n
    // Remove .fvm files from search\n
    "search.exclude": {\n
      "**/.fvm": true\n
    },\n
    // Remove from file watching\n
    "files.watcherExclude": {\n
      "**/.fvm": true\n
    }\n
  }\n
END
)

echo $json > $dir/$file
