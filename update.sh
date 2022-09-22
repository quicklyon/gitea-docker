#!/bin/bash

# shellcheck disable=SC1091

set -Eeuo pipefail

. debian/prebuildfs/opt/easysoft/scripts/liblog.sh

REPO_URL="https://api.github.com/repos/go-gitea/gitea/releases/latest"

TODAY=$(date +%Y%m%d)
LATEST_VER=$( curl -s -L $REPO_URL | jq -r .tag_name | sed 's/^v//')
export LATEST_VER

GITURL=$(jq -r .GitUrl app.json)
export GITURL

CURRENT_VER=$( grep ver VERSION |sed 's/ver://g')
export CURRENT_VER

# generate new version changelog
gen_changelog(){
  info "Generate changelog/${TODAY}.md ..."
  sleep 2
  render-template .template/changelog.md.tpl > changelog/"${TODAY}".md && cat changelog/"${TODAY}".md
}

SHA256=$(curl -s -L -k "$GITURL"/releases/download/v"$LATEST_VER"/gitea-"$LATEST_VER"-linux-amd64.sha256|awk '{print $1}')

if [ "$LATEST_VER" != "$CURRENT_VER" ];then
  sed -i -r "s/(ver:)$CURRENT_VER/\1$LATEST_VER/g" VERSION
  sed -i -r "s/(sha256:).*/\1$SHA256/g" VERSION

  warn "Gitea new version->$LATEST_VER was detected. Please rebuild the image."
  gen_changelog
else
  info "$CURRENT_VER is the latest version."
fi
