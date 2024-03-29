#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR/..

NEW_VERSION="${1}"

echo "Bumping version: ${NEW_VERSION}"

perl -pi -e "s/^version: .*/version: $NEW_VERSION/" pubspec.yaml
perl -pi -e "s/^  yandex_geocoder: .*/  yandex_geocoder: $NEW_VERSION/" README.md
perl -pi -e "s/^  yandex_geocoder: .*/  yandex_geocoder: $NEW_VERSION/" README.ru.md
