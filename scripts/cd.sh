#!/usr/bin/env bash

if [ "$(basename "$PWD")" = 'scripts' ]; then cd ..; fi

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -t|--tag)
    TAG="$2"
    shift
    shift
    ;;
    -h|--help)
    echo "Usage: $0 --tag <tag_name>"
    echo "  --tag <tag_name>  Specify the tag name ex: --tag 4.04.21-qa+40421001-lr"
    echo "  -h, --help       Show this help message and exit"
    exit 0
    ;;
    *)
    echo "Unknown option $1"
    exit 1
    ;;
esac
done

if [[ -z "$TAG" ]]; then
  echo "Error: tag is required. Use --help for more information."
  exit 1
fi

# Defining colors for console output
GREEN_COLOR=$(tput setaf 2)  # Green color
RED_COLOR=$(tput setaf 1)  # Red color
RESET_COLOR=$(tput sgr0)  # Reset color

echo "Stage: ${GREEN_COLOR}Git pull${RESET_COLOR}"
# Perform a pull to fetch the latest changes.
echo "Pulling the latest changes from Git..."
git pull
echo "Git pull completed successfully."

echo "Stage: ${GREEN_COLOR}Parse tag${RESET_COLOR}"
# Parsing a tag to obtain version, build number, environment, and project.
if [[ $TAG =~ ^([0-9]+\.[0-9]+\.[0-9]+)-?([a-zA-Z]+)?\+?([0-9]+)?-?([a-zA-Z]+)?$ ]]; then
  version=${BASH_REMATCH[1]}
  env=${BASH_REMATCH[2]}
  build=${BASH_REMATCH[3]}
  project=${BASH_REMATCH[4]}

  echo "Version: ${version}"
  echo "Build Number: ${build}"
  echo "Environment: ${env}"
  echo "Project: ${project}"
else
  echo "Invalid tag format"
fi

echo "Stage: ${GREEN_COLOR}Calculate and update version${RESET_COLOR}"
# Updating the version in the pubspec.yaml file.
oldVersion=$(grep 'version:' pubspec.yaml)
sed -i.bak "s/$oldVersion/version: $TAG/g" pubspec.yaml

echo "Stage: ${GREEN_COLOR}Tag create${RESET_COLOR}"
# Deleting local tags that are not present in the remote repository.
remoteList=$(git ls-remote --tags origin)
localList=$(git tag)

for tag in $localList; do
  if [[ "$remoteList" != *"$tag"* ]]; then
    git tag -d $tag
  fi
done

git fetch --tags

# Creating a new tag with changes from the latest commit and pushing it to the remote repository.
CHANGELOG=$(git log --pretty=format:'%h %s (%an)' $(git describe --tags --abbrev=0)..HEAD)
git tag -a "$TAG" -m "$CHANGELOG"
git push origin "$TAG"
git push --tags

echo $CHANGELOG
export CHANGELOG="$CHANGELOG"

echo "Stage: ${GREEN_COLOR}Build and deploy${RESET_COLOR}"
# In this block, the project is built and deployed for Android and iOS.
fvm flutter pub run surf_flutter_ci_cd full --env=$env --proj=$project --target=android --deploy-to=fb || { echo "${RED_COLOR}Failed to build or deploy android${RESET_COLOR}"; exit 1; }
fvm flutter pub run surf_flutter_ci_cd full --env=$env --proj=$project --target=ios --deploy-to=tf || { echo "${RED_COLOR}Failed to build or deploy ios{RESET_COLOR}"; exit 1; }

echo "Stage: ${GREEN_COLOR}Update pubspec.yaml${RESET_COLOR}"
# If the commands are executed successfully, then commit and push the version changes.
git add pubspec.yaml
git commit -m "Bump version"
git push
