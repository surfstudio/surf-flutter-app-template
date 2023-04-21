#!/bin/bash

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

# Определение цветов для вывода в консоль
GREEN_COLOR=$(tput setaf 2)  # Зеленый цвет
RED_COLOR=$(tput setaf 1)  # Красный цвет
RESET_COLOR=$(tput sgr0)  # Сброс цвета

echo "Stage: ${GREEN_COLOR}Git pull${RESET_COLOR}"
# Выполняем pull, чтобы получить последние изменения
echo "Pulling the latest changes from Git..."
git pull
echo "Git pull completed successfully."

echo "Stage: ${GREEN_COLOR}Parse tag${RESET_COLOR}"
# Парсинг тега, чтобы получить версию, номер сборки, окружение и проект
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
# Обновляем версию в файле pubspec.yaml
oldVersion=$(grep 'version:' pubspec.yaml)
sed -i.bak "s/$oldVersion/version: $TAG/g" pubspec.yaml

echo "Stage: ${GREEN_COLOR}Tag create${RESET_COLOR}"
# Удаляем локальные теги, которые отсутствуют в удаленном репозитории
remoteList=$(git ls-remote --tags origin)
localList=$(git tag)

for tag in $localList; do
  if [[ "$remoteList" != *"$tag"* ]]; then
    git tag -d $tag
  fi
done

git fetch --tags

# Создаем новый тег с изменениями из последнего коммита и пушим его в удаленный репозиторий
CHANGELOG=$(git log --pretty=format:'%h %s (%an)' $(git describe --tags --abbrev=0)..HEAD)
git tag -a "$TAG" -m "$CHANGELOG"
git push origin "$TAG"
git push --tags

echo $CHANGELOG
export CHANGELOG="$CHANGELOG"

echo "Stage: ${GREEN_COLOR}Build and deploy${RESET_COLOR}"
# В этом блоке происходит сборка и развертывание проекта для Android и iOS
fvm flutter pub run surf_flutter_ci_cd full --env=$env --proj=$project --target=android --deploy-to=fb || { echo "${RED_COLOR}Failed to build or deploy android${RESET_COLOR}"; exit 1; }
fvm flutter pub run surf_flutter_ci_cd full --env=$env --proj=$project --target=ios --deploy-to=tf || { echo "${RED_COLOR}Failed to build or deploy ios{RESET_COLOR}"; exit 1; }

echo "Stage: ${GREEN_COLOR}Update pubspec.yaml${RESET_COLOR}"
# Если команды выполнены успешно, то делаем коммит и пушим изменения версии
git add pubspec.yaml
git commit -m "Bump version"
git push
